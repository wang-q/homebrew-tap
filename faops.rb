class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.20.tar.gz"
  version "0.8.20"
  sha256 "a7fb3246b50c3ce2d0c2abb015bf5374e4ae950ea198f7dbc25266ec0889d822"

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
