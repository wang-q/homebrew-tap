class Fastk < Formula
  desc "FastK: A K-mer counter (for HQ assembly data sets)"
  homepage "https://github.com/thegenemyers/FASTK"

  head "https://github.com/thegenemyers/FASTK.git", revision: "ddea6cf"

  def install
    chdir "LIBDEFLATE" do
      system "make"
    end
    chdir "HTSLIB" do
      system "make", "libhts.a"
    end
    chdir "HTSLIB" do
      system "make", "htslib_static.mk"
    end

    system "make"
    bin.install %w[FastK Fastrm Fastmv Fastcp Fastmerge Histex Tabex Profex Logex Vennex Symmex Haplex Homex]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/FastK 2>&1", 1)
  end
end
