class DalignerAT20170203 < Formula
  desc "DALIGNER: Find all significant local alignments between reads"
  homepage "https://github.com/thegenemyers/DALIGNER"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DALIGNER/archive/20170203.tar.gz"
  sha256 "612f9ffc37f28efa5cb9bf4f056f9b9b9421172800b83de93db2008c1e595c7b"

  head "https://github.com/wang-q/DALIGNER.git"

  def install
    system "make"
    bin.install %w[daligner HPC.daligner LAcat LAcheck LAdump LAindex LAmerge LAshow LAsort LAsplit LA4Falcon]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/daligner 2>&1", 1)
  end
end
