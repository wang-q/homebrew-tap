class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.8.tar.gz"
  version "0.8.8"
  sha256 "0ff0e68d0fc715102941960061a7599dd9ff0a080cb473d38ebcdbb86ed4ed39"

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
