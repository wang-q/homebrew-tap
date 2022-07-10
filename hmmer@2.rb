class HmmerAT2 < Formula
  desc "Profile HMM models for protein sequences"
  homepage "http://hmmer.org/"
  url "http://eddylab.org/software/hmmer/2.4i/hmmer-2.4i.tar.gz"
  sha256 "73cb85c2197017fa7a25482556ed250bdeed256974b99b0c25e02854e710a886"

  version "2.4i"

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{prefix}",
                          "--enable-threads", "--enable-lfs", "--disable-altivec"
    system "make"

    hmmalign        

    bin.install "src/hmmalign"     => "hmmalign2"
    bin.install "src/hmmbuild"     => "hmmbuild2"
    bin.install "src/hmmcalibrate" => "hmmcalibrate2"
    bin.install "src/hmmconvert"   => "hmmconvert2"
    bin.install "src/hmmemit"      => "hmmemit2"
    bin.install "src/hmmfetch"     => "hmmfetch2"
    bin.install "src/hmmindex"     => "hmmindex2"
    bin.install "src/hmmpfam"      => "hmmpfam2"
    bin.install "src/hmmsearch"    => "hmmsearch2"

  end

  test do
    system "#{bin}/hmmalign2", "-h"
  end
end
