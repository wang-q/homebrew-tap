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
  url "https://raw.githubusercontent.com/wang-q/homebrew-tap/master/external/superreads-3.1.3.tar.gz"
  sha256 "8cee09f7fcf967583b0998046a81d607c32a824aea4ada61d5d190640ced782a"
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
