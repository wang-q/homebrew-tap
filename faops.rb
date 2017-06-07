class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.7.0.tar.gz"
  version "0.7.0"
  sha256 "6cba10af095aecc713e34dab55a1038a9525a3d76f930b25422a7f599c2350bf"

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
