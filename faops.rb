class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.11.tar.gz"
  version "0.8.11"
  sha256 "299c3a21af7f1951fe3a158ba11dbd54cb27cc34274c19cb87281c96291dcca2"

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
