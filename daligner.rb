class Daligner < Formula
  desc "DALIGNER: Find all significant local alignments between reads"
  homepage "https://github.com/thegenemyers/DALIGNER"

  head "https://github.com/thegenemyers/DALIGNER.git", revision: "a8e2f42"

  def install
    system "make"
    bin.install %w[
      daligner
      LAsort
      LAmerge
      LAshow
      LA2ONE
      ONE2LA
      LAcat
      LAsplit
      LAcheck
      HPC.daligner
    ]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/daligner 2>&1", 1)
  end
end
