class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.15.tar.gz"
  version "0.8.15"
  sha256 "ae15d262ab1c55de0f7650799e92469cffb303c4232d5a8f2525d27a74938fc4"

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
