class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.13.tar.gz"
  version "0.8.13"
  sha256 "d101c29e618d8b9c8dd5e237cc2c0b95d6fe2e243bee788b316a0af402ba72aa"

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
