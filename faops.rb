class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.4.0.tar.gz"
  version "0.4.0"
  sha256 "7cf71764fc76ca431bc3d3155979484a3cbf6cd3c0317796ca117746f1de993f"

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
