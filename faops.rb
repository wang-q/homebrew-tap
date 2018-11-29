class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.16.tar.gz"
  version "0.8.16"
  sha256 "96bd58006c4b4b2d901dbaf32c63b511ac463a4cd306f923c52523763ac87474"

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
