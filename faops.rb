class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.0.tar.gz"
  version "0.8.0"
  sha256 "a4c7ecbe40fafe24cb297c9cf48735d2dae6752560ea16c1be696057fb59f5d7"

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
