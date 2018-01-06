class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.7.tar.gz"
  version "0.8.7"
  sha256 "8bb079947dd3986e1619b0bed50a1d53544e5c89610c2f754deca3986bf84123"

  depends_on "zlib"

  def install
    system "make"
    bin.install "faops"
    doc.install "README.md"
  end

  test do
    system "#{bin}/faops", "help"
  end
end
