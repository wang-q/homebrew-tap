class MultizTba < Formula
  desc "Multiz and TBA alignment programs"
  homepage "http://www.bx.psu.edu/miller_lab/"
  url "http://www.bx.psu.edu/miller_lab/dist/multiz-tba.012109.tar.gz"
  version "20090121"
  sha256 "fa1146b4ee230ce85b32c7f1d426b05efbe19399f83be6576bd0ce226cbb712c"

  def install
    inreplace "Makefile", "-Werror", ""
    system "make"
    bin.install %w[
      all_bz blastzWrapper get_covered get_standard_headers lav2maf maf2fasta maf2lav mafFind
      maf_checkThread maf_order maf_project maf_sort multic multiz pair2tb roast single_cov2 tba
    ]
  end

  test do
    system "#{bin}/multiz"
  end
end
