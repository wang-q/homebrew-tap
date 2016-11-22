class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.3.0.tar.gz"
  version "0.3.0"
  sha256 "d9f59ac00f9402fbf14233dc2b0a56305572b75db86680c3eb01a80a25a7ca0b"

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
