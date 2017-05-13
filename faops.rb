class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.5.2.tar.gz"
  version "0.5.2"
  sha256 "76ab7dc19d50f26d6cf90de0095dc532cb05f4491e27307cb8827547008f3521"

  depends_on "homebrew/dupes/zlib"

  def install
    system "make"
    bin.install "faops"
    doc.install "README.md"
  end

  test do
    system "#{bin}/faops", "help"
  end
end
