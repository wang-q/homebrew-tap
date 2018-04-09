class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.10.tar.gz"
  version "0.8.10"
  sha256 "fbd681a37e916d81c1c9e24a2a719c822b186d794392df7480601a5e6641e527"

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
