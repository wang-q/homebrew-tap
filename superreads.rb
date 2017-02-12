class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "This software is only supported on Linux. Mac OS is missing the required function mremap."
  end
end

class Superreads < Formula
  desc "SuperReads: a simplified version of MaSuRCA"
  homepage "http://www.genome.umd.edu/masurca.html"
  url "https://raw.githubusercontent.com/wang-q/homebrew-tap/master/external/superreads-3.1.3.tar.gz"
  sha256 "1544961d1777df1e3e015433d6d7470372283f88271bd14b6cb5ca78c6d36bba"
  # doi "10.1093/bioinformatics/btt476"
  # tag "bioinformatics"

  # Remove ufasta may solve the problem
  depends_on LinuxRequirement

  def install
    system "./configure",
      "--disable-silent-rules",
      "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/create_k_unitigs_large_k", "--help"
  end
end
