class DazzDbAT20201008 < Formula
  desc "DAZZ_DB: The Dazzler Data Base"
  homepage "https://github.com/thegenemyers/DAZZ_DB"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DAZZ_DB/archive/20201008.tar.gz"
  sha256 "030dc18429ccd5781a0a091903004790c8c0b5a6a066b43d02104970a1ed2eeb"

  head "https://github.com/wang-q/DAZZ_DB.git"

  def install
    system "make"
    bin.install %w[arrow2DB Catrack DAM2fasta DB2arrow DB2fasta DB2quiva DBdump DBdust DBrm DBshow DBsplit DBstats DBwipe fasta2DAM fasta2DB quiva2DB rangen simulator]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fasta2DB 2>&1", 1)
  end
end
