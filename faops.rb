class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.5.1.tar.gz"
  version "0.5.1"
  sha256 "a5128987bd7710b75201caf48ecc277a690b5adcbf807e256595a969cece2ff6"

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
