class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.2.3.tar.gz"
  version "0.2.3"
  sha256 "57c9e0ab30bebe0b1dffc9e878398126547b6c11ab21aa00373510009c546521"

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
