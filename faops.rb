class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.2.tar.gz"
  version "0.8.2"
  sha256 "8312ea09c0446050c4e680f2103512715e06a2c7a59022737d3f909913b1d61c"

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
