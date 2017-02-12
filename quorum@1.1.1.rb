class Quorum < Formula
  desc "QUality Optimized Reads from the University of Maryland"
  homepage "https://github.com/gmarcais/Quorum"
  url "https://github.com/gmarcais/Quorum/releases/download/v1.1.1/quorum-1.1.1.tar.gz"
  version "1.1.1"
  sha256 "45d099835eaad43cf915e118e9cb6423411d68c7f35a8145bc725dca366c82b5"
  # doi "arXiv:1307.3515"
  # tag "bioinformatics"

  depends_on "jellyfish"
  depends_on "pkg-config" => :build

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
