class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.2.1.tar.gz"
  version "0.2.1"
  sha256 "f6428a2527c1eb24726b8c11880ce243f8f0e06acd8f102cf0cb97b9ceef85ef"

  depends_on "zlib"

  def install
    system "make"
    bin.install "faops"
    doc.install "README.md"
  end

  test do
    system "#{bin}/scythe", "count"
  end
end
