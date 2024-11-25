class DazzDb < Formula
  desc "DAZZ_DB: The Dazzler Data Base"
  homepage "https://github.com/thegenemyers/DAZZ_DB"

  head "https://github.com/thegenemyers/DAZZ_DB.git", revision: "be65e59"

  def install
    system "make"
    bin.install %w[
      fasta2DB
      DB2fasta
      quiva2DB
      DB2quiva
      arrow2DB
      DB2arrow
      fasta2DAM
      DAM2fasta
      DBsplit
      DBtrim
      DBdust
      Catrack
      DBshow
      DB2ONE
      DBstats
      DBrm
      DBmv
      DBcp
      DBwipe
      simulator
      rangen
    ]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/fasta2DB 2>&1", 1)
  end
end
