class DazzDbAT20190923 < Formula
  desc "DAZZ_DB: The Dazzler Data Base"
  homepage "https://github.com/thegenemyers/DAZZ_DB"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DAZZ_DB/archive/20190923.tar.gz"
  sha256 "051ec233ed7bea6b8056555fcad3858d8eff90b55ca0e3a25b4c4dd753fdd333"

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
