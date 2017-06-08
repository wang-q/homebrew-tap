class Faops < Formula
  desc "faops: Operate fasta files"
  homepage "https://github.com/wang-q/faops"
  url "https://github.com/wang-q/faops/archive/0.7.1.tar.gz"
  version "0.7.1"
  sha256 "23c925f64504339b6968915139be8577e3f9acd4c709f4712077cede26b85349"

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
