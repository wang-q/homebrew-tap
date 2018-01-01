class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.6.tar.gz"
  version "0.8.6"
  sha256 "2aeb5ac11b4f92f70e89bd3b622d2275d554280744f89ae59db45cf14bf7052b"

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
