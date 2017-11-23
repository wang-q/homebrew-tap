class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.4.tar.gz"
  version "0.8.4"
  sha256 "fb3292aec58d77d96ddda0c4fcc751889c0a1e3511cf91e797e401ed272a4226"

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
