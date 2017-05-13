class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.6.1.tar.gz"
  version "0.6.1"
  sha256 "6c3a59fc0c5927d775b12af83e4608c1cd910aa2e2ba51503d7a51d8c31151b0"

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
