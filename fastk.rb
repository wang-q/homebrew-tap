class Fastk < Formula
  desc "FastK: A K-mer counter (for HQ assembly data sets)"
  homepage "https://github.com/thegenemyers/FASTK"

  head "https://github.com/thegenemyers/FASTK.git" revision: "4604bfc"

  def install
    system "make"
    bin.install %w[FastK Fastrm Fastmerge Fastcp Fastmv Haplex Histex Homex Logex Profex Symmex Tabex Vennex]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/FastK 2>&1", 1)
  end
end
