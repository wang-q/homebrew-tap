class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.2.4.tar.gz"
  version "0.2.4"
  sha256 "8711968dc3b8e04a025c5384c679614ebff236620d121ad5a570ec5bf819b92a"

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
