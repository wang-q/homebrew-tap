class Fastga < Formula
  desc "FastGA: A Fast Genome Aligner"
  homepage "https://github.com/thegenemyers/FASTGA"

  head "https://github.com/thegenemyers/FASTGA.git", revision: "e97c33e"

  def install
    system "make"
    bin.install %w[
      FastGA
      FAtoGDB
      GIXmake
      ALNtoPAF
      ALNtoPSL
      GDBshow
      GDBstat
      GIXshow
      ALNshow
      ALNplot
      GDBtoFA
      GIXrm
      GIXmv
      GIXcp
      ALNchain
      ALNreset
      PAFtoALN
      PAFtoPSL
    ]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/FastGA 2>&1", 1)
  end
end
