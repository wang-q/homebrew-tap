class DazzDb < Formula
  desc "DAZZ_DB: The Dazzler Data Base"
  homepage "https://github.com/thegenemyers/DAZZ_DB"

  head "https://github.com/thegenemyers/DAZZ_DB.git", revision: "70d2c8e"

  def install
    system "make"
    bin.install %w[arrow2DB Catrack DAM2fasta DB2arrow DB2fasta DB2quiva DBdump DBdust DBrm DBshow DBsplit DBstats DBwipe fasta2DAM fasta2DB quiva2DB rangen simulator]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fasta2DB 2>&1", 1)
  end
end
