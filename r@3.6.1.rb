class RAT361 < Formula
  desc "Software environment for statistical computing"
  homepage "https://www.r-project.org/"
  url "https://cran.r-project.org/src/base/R-3/R-3.6.1.tar.gz"
  sha256 "5baa9ebd3e71acecdcc3da31d9042fb174d55a42829f8315f2457080978b1389"

  depends_on :linux
  depends_on "pkg-config" => :build
  depends_on "gcc" # for gfortran
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "openblas"
  depends_on "pcre"
  depends_on "readline"
  depends_on "xz"
  depends_on "zlib"
  depends_on "bzip2"
  depends_on "cairo"
  depends_on "curl"

  # needed to preserve executable permissions on files without shebangs
  skip_clean "lib/R/bin"

  resource "gss" do
    url "https://cran.r-project.org/src/contrib/gss_2.2-3.tar.gz", :using => :nounzip
    mirror "https://mirrors4.tuna.tsinghua.edu.cn/CRAN/src/contrib/gss_2.2-3.tar.gz"
    sha256 "24306401cf4e5869f8a690eca7e17c044ece83edd66969bd2daf5976272d244b"
  end

  def install
    args = [
      "--prefix=#{prefix}",
      "--enable-memory-profiling",
      "--enable-R-shlib",
      "--with-lapack",
      "--disable-java",
      "--with-blas=-L#{Formula["openblas"].opt_lib} -lopenblas",
      "--without-x",
      "--without-tcltk",
      "--without-ICU",
    ]

    # don't remember Homebrew's sed shim
    args << "SED=/usr/bin/sed" if File.exist?("/usr/bin/sed")

    args << "--libdir=#{lib}" # avoid using lib64 on CentOS
    args << "--with-cairo"

    # If LDFLAGS contains any -L options, configure sets LD_LIBRARY_PATH to
    # search those directories. Remove -LHOMEBREW_PREFIX/lib from LDFLAGS.
    ENV.remove "LDFLAGS", "-L#{HOMEBREW_PREFIX}/lib"

    # Help CRAN packages find gettext and readline
    ["readline"].each do |f|
      ENV.append "CPPFLAGS", "-I#{Formula[f].opt_include}"
      ENV.append "LDFLAGS", "-L#{Formula[f].opt_lib}"
    end

    system "./configure", *args
    system "make"
    ENV.deparallelize do
      system "make", "install"
    end

    cd "src/nmath/standalone" do
      system "make"
      ENV.deparallelize do
        system "make", "install"
      end
    end

    r_home = lib/"R"

    # make Homebrew packages discoverable for R CMD INSTALL
    inreplace r_home/"etc/Makeconf" do |s|
      s.gsub!(/^CPPFLAGS =.*/, "\\0 -I#{HOMEBREW_PREFIX}/include")
      s.gsub!(/^LDFLAGS =.*/, "\\0 -L#{HOMEBREW_PREFIX}/lib")
      s.gsub!(/.LDFLAGS =.*/, "\\0 $(LDFLAGS)")
    end

    include.install_symlink Dir[r_home/"include/*"]
    lib.install_symlink Dir[r_home/"lib/*"]

    # avoid triggering mandatory rebuilds of r when gcc is upgraded
    inreplace lib/"R/etc/Makeconf",
      Formula["gcc"].prefix.realpath,
      Formula["gcc"].opt_prefix,
      OS.mac?
  end

  def post_install
    short_version =
      `#{bin}/Rscript -e 'cat(as.character(getRversion()[1,1:2]))'`.strip
    site_library = HOMEBREW_PREFIX/"lib/R/#{short_version}/site-library"
    site_library.mkpath
    ln_s site_library, lib/"R/site-library"
  end

  test do
    dylib_ext = OS.mac? ? ".dylib" : ".so"
    assert_equal "[1] 2", shell_output("#{bin}/Rscript -e 'print(1+1)'").chomp
    assert_equal dylib_ext, shell_output("#{bin}/R CMD config DYLIB_EXT").chomp

    testpath.install resource("gss")
    system bin/"R", "CMD", "INSTALL", "--library=.", Dir["gss*"].first
    assert_predicate testpath/"gss/libs/gss.so", :exist?,
                     "Failed to install gss package"
  end
end
