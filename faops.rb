class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.3.2.tar.gz"
  version "0.3.2"
  sha256 "e1a3c1bfd70b3197da98cf28be820d057da39f16b652ffb3d79e747bea938b0a"

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
