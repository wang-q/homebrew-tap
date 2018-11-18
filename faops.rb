class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.14.tar.gz"
  version "0.8.14"
  sha256 "37b5fbe07c23bc21752ae93b97230ca45b35b52dfef301eea8ee426e92584caa"

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
