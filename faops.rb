class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.12.tar.gz"
  version "0.8.12"
  sha256 "a2f4317fb20afa9e702492db703a38e92678cec08f77403c9b27dcc6401d28c4"

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
