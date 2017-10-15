class QuorumAT111 < Formula
  desc "QUality Optimized Reads from the University of Maryland"
  homepage "https://github.com/gmarcais/Quorum"
  # doi "arXiv:1307.3515"
  # tag "bioinformatics"

  url "https://github.com/gmarcais/Quorum/releases/download/v1.1.1/quorum-1.1.1.tar.gz"
  sha256 "45d099835eaad43cf915e118e9cb6423411d68c7f35a8145bc725dca366c82b5"
  version "1.1.1"
  revision 1

  depends_on "jellyfish"
  depends_on "pkg-config" => :build

  head do
    url "https://github.com/gmarcais/Quorum.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "yaggo" => :build
  end

  def install
    system "autoreconf", "-fi" if build.head?
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
