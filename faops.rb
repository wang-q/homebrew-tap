class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.5.0.tar.gz"
  version "0.5.0"
  sha256 "f3a20c4e9604029ba49ac9a2d1f14f27196574066a2f360d875156f41e9dfcea"

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
