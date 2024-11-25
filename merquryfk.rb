class Merquryfk < Formula
  desc "MerquryFK & KatFK: Fast & Simple"
  homepage "https://github.com/thegenemyers/MERQURY.FK"

  head "https://github.com/thegenemyers/MERQURY.FK.git", revision: "a100533"

  def install
    system "make"
    bin.install %w[
      HAPmaker
      CNplot
      ASMplot
      HAPplot
      MerquryFK
      KatComp
      KatGC
      PloidyPlot
    ]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/HAPmaker 2>&1", 1)
  end
end
