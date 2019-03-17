class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.17.tar.gz"
  version "0.8.17"
  sha256 "f883f85b206483707665bfa46add4c3778529304c3b8f85f56da2facc88fc591"

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
