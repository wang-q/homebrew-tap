class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.5.tar.gz"
  version "0.8.5"
  sha256 "e8d68d041aae0a25ffd52411bc93ba7efc91c6c43489e37f3d56df06bb96b5f1"

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
