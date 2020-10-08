class DalignerAT20201008 < Formula
  desc "DALIGNER: Find all significant local alignments between reads"
  homepage "https://github.com/thegenemyers/DALIGNER"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DALIGNER/archive/20201008.tar.gz"
  sha256 "8e7d2de2e6054db924ae9a6d4d5025056b957877382d8c916c324ebc1e69dca6"

  head "https://github.com/wang-q/DALIGNER.git"

  def install
    system "make"
    bin.install %w[daligner dumpLA HPC.daligner LAa2b LAb2a LAcat LAcheck LAdump LAmerge LAshow LAsort LAsplit]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/daligner 2>&1", 1)
  end
end
