class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.18.tar.gz"
  version "0.8.18"
  sha256 "c250f9745e901fc3afadd2c85bc910e2b7e68dc1febc3ed73a4afbe9d5f46ca3"

  head do
    url "https://github.com/wang-q/faops.git"
  end

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
