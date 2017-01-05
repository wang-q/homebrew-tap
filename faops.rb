class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.3.1.tar.gz"
  version "0.3.1"
  sha256 "7999fbeccbb6456e601c9e04d28ea645c9e04123e7136e56ad10c56dd067cbff"

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
