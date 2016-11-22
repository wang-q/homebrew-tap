class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.2.4.tar.gz"
  version "0.2.3"
  sha256 "360c7a2a8c954b1ca050010639ece3d8440c06f411064551dccaf1af214c2dfa"

  depends_on "homebrew/dupes/zlib"

  def install
    system "make"
    bin.install "faops"
    doc.install "README.md"
  end

  test do
    system "#{bin}/faops", "help"
  end
end
