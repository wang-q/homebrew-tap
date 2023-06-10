class QuorumAT112 < Formula
  desc "QUality Optimized Reads from the University of Maryland"
  homepage "http://www.genome.umd.edu/quorum.html"
  url "https://github.com/gmarcais/Quorum/releases/download/v1.1.2/quorum-1.1.2.tar.gz"
  sha256 "bfa2ac8b756242028f37979f91ac2a805d311e9c84fb04c73d9136a8b129992f"

  depends_on "pkg-config" => :build
  depends_on "jellyfish"

  fails_with :clang do
    build 600
    cause "error: 'ext/stdio_filebuf.h' file not found"
  end

  def install
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
