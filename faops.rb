class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.3.3.tar.gz"
  version "0.3.3"
  sha256 "e0a35629181932e8644fb110d8d0563f489c72c2bfbdfd27cd8cc59e0a5c682a"

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
