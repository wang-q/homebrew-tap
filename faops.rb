class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.3.tar.gz"
  version "0.8.3"
  sha256 "caf681e98bc8eed59e5c55e07f05c25e2d2370ee63faf5a7fd3c9ff091b8137c"

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
