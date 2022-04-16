class QuorumAT111 < Formula
  desc "QUality Optimized Reads from the University of Maryland"
  homepage "http://www.genome.umd.edu/quorum.html"
  url "https://github.com/gmarcais/Quorum/releases/download/v1.1.1/quorum-1.1.1.tar.gz"
  sha256 "45d099835eaad43cf915e118e9cb6423411d68c7f35a8145bc725dca366c82b5"

  depends_on "pkg-config" => :build
  depends_on "gcc@5" => :build
  depends_on "jellyfish"

  fails_with :clang do
    build 600
    cause "error: 'ext/stdio_filebuf.h' file not found"
  end

  def install
    # gcc@5
    ENV["CC"] = Formula["gcc@5"].opt_bin/"gcc-5"
    ENV["CXX"] = Formula["gcc@5"].opt_bin/"g++-5"

    system "./configure",
      "--disable-debug",
      "--disable-dependency-tracking",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/quorum", "--version"
  end
end
