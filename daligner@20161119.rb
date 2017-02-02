class DalignerAT20161119 < Formula
  desc "DALIGNER: Find all significant local alignments between reads"
  homepage "https://github.com/thegenemyers/DALIGNER"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DALIGNER/archive/20161119.tar.gz"
  sha256 "410000c911b230d34b19a668d7e40ed78b94243dee5ebdd5340061ea95c2c6b4"

  head "https://github.com/wang-q/DALIGNER.git"

  def install
    system "make"
    bin.install %w[daligner HPC.daligner LAcat LAcheck LAdump LAindex LAmerge LAshow LAsort LAsplit]
    doc.install "README"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/daligner 2>&1", 1)
  end
end
