class KatAT242 < Formula
  desc "KAT - The K-mer Analysis Toolkit"
  homepage "https://github.com/TGAC/KAT"
  url "https://github.com/TGAC/KAT/archive/Release-2.4.2.tar.gz"
  sha256 "d6116cefdb5ecd9ec40898dd92362afe1a76fa560abfe0f2cd29cbe0d95cb877"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  depends_on "boost"

  def install
    # Disable unsupported compiler flags on macOS
    inreplace [
      "deps/boost/tools/build/src/tools/darwin.py",
      "deps/boost/tools/build/src/tools/darwin.jam",
    ] do |s|
      s.gsub! "-fcoalesce-templates", ""
      s.gsub! "-Wno-long-double", ""
    end

    boost = Formula["boost"]
    inreplace "lib/Makefile.am", "$(top_builddir)/deps/boost/build/lib", boost.opt_lib
    inreplace ["src/Makefile.am", "tests/Makefile.am"] do |s|
      s.gsub! "$(top_builddir)/deps/boost/build/lib", boost.opt_lib
      s.gsub! "$(top_srcdir)/deps/boost/build/include", boost.opt_include
    end

    ENV["PYTHON"] = "python3"

    system "./autogen.sh"
    system "./configure",
      "--disable-silent-rules",
      "--disable-pykat-install",
      *std_configure_args
    system "make"
    system "make", "install"

  end

  def caveats; <<~EOS
    Avoid install Python dependcies via brew.
    pip3 install tabulate  numpy scipy matplotlib
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kat --version")
  end
end
