class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/refs/tags/0.8.21.tar.gz"
  version "0.8.21"
  sha256 "925da952f9b6697899982cc0b79d0a03d5f680837b479140efbd3a6b241c9da0"

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
