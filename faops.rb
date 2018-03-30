class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.9.tar.gz"
  version "0.8.9"
  sha256 "89c20a9434478c406fe27b1c8de2a7e20870052fe6b35e0d9321a2191f2e5a66"

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
