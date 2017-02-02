class DazzDbAT20161112 < Formula
  desc "DAZZ_DB: The Dazzler Data Base"
  homepage "https://github.com/thegenemyers/DAZZ_DB"
  # doi "10.1007/978-3-662-44753-6_5"
  # tag "bioinformatics"

  url "https://github.com/wang-q/DAZZ_DB/archive/20161112.tar.gz"
  sha256 "f07d6faf6b6f6c69989248382653de295496d230852e02faf3c0043990db29e4"

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
