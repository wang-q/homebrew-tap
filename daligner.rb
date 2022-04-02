class Daligner < Formula
  desc "DALIGNER: Find all significant local alignments between reads"
  homepage "https://github.com/thegenemyers/DALIGNER"

  head "https://github.com/thegenemyers/DALIGNER.git", revision: "f61b8cf"

  def install
    system "make"
    bin.install %w[daligner dumpLA HPC.daligner LAa2b LAb2a LAcat LAcheck LAdump LAmerge LAshow LAsort LAsplit]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/daligner 2>&1", 1)
  end
end
