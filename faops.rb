class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.3.2.tar.gz"
  version "0.3.2"
  sha256 "b444a0469715f4abf8d0c927e8e6e5a379dff13e520e4735da3bbfe6055f29ce"

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
