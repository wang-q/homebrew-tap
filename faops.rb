class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.8.1.tar.gz"
  version "0.8.1"
  sha256 "526ea874be92b670a127b7b20063a6a8d31a89b9a892562bebcb96617096ee42"

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
