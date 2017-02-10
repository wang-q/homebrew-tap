class LinuxRequirement < Requirement
  fatal true
  satisfy OS.linux?
  def message
    "This software is only supported on Linux. Mac OS is missing the required function mremap."
  end
end

class Superreads < Formula
  desc "SuperReads_RNA: a simplified version of MaSuRCA"
  homepage "http://www.genome.umd.edu/masurca.html"
  url "https://raw.githubusercontent.com/wang-q/homebrew-tap/master/external/SuperReads_RNA-1.0.1.tar.gz"
  sha256 "7e058593e1b4d5f58a24d372b1c9931d76c2a94bbd57d44745240531dd06a0da"
  # doi "10.1093/bioinformatics/btt476"
  # tag "bioinformatics"

  # Remove ufasta may solve the problem
  depends_on LinuxRequirement

  def install
    ENV.deparallelize
    ENV["DEST"] = prefix
    system "./install.sh"

    # Conflicts with jellyfish
    rm bin/"jellyfish"
    rm Dir[lib/"libjellyfish*", lib/"pkgconfig/jellyfish-2.0.pc"]
    rm_r include/"jellyfish-1"
    rm man1/"jellyfish.1"
  end

  test do
    system "#{bin}/createSuperReads_RNA", "-h"
  end
end
