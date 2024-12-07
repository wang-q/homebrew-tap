class RmblastAT2141 < Formula
  desc "RepeatMasker compatible version of the standard NCBI BLAST suite"
  homepage "https://www.repeatmasker.org/RMBlast.html"
  if OS.mac?
    url "https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-macosx.tar.gz"
    sha256 "65f25f8bcd6cfa4b22f520573e9d1961a84ea07a45bf6fbcc291add057f36edf"
  else
    url "https://www.repeatmasker.org/rmblast/rmblast-2.14.1+-x64-linux-GLIBC_2.31.tar.gz"
    sha256 "abfeb27a74674b938c863cf76d13cc4d98481e9c1abfde2f45c10a5faa8f96e5"
  end
  version "2.14.1"

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match "USAGE", shell_output("#{bin}/rmblastn -help")
  end
end
