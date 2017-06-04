class Platanus < Formula
  desc "Platanus: PLATform for Assembling NUcleotide Sequences"
  homepage "http://platanus.bio.titech.ac.jp/"
  url "http://platanus.bio.titech.ac.jp/?ddownload=150"
  sha256 "7a665c0834fd064525f337639bba77a4975c4e76d029dcba2e19028c9c14fbc2"
  version "1.2.4"
  revision 1

  def install
    inreplace "Makefile", "Wall", "Wall -fpermissive"
    system "make"
    bin.install "platanus"
  end

  test do
    system "#{bin}/platanus"
  end
end
