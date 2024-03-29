class MemeAT4 < Formula
  # cite Bailey_2009: "https://doi.org/10.1093/nar/gkp335"
  desc "Tools for motif discovery"
  homepage "http://meme-suite.org"
  url "http://meme-suite.org/meme-software/4.11.2/meme_4.11.2_2.tar.gz"
  sha256 "377238c2a9dda64e01ffae8ecdbc1492c100df9b0f84132d50c1cf2f68921b22"
  version "4.11.2_2"

  def install
    ENV.deparallelize
    system "./configure", "--prefix=#{libexec}",
        "--disable-debug", "--disable-dependency-tracking",
        "--enable-build-libxml2", "--enable-build-libxslt"
    system "make", "install"

    prefix.install "tests"

    perl_files = `grep -l -w "#!/usr/bin/perl" #{libexec}/bin/*`.split("\n")
    perl_files.each do |file|
      inreplace file, %r{^#!/usr/bin/perl.*}, "#!/usr/bin/env perl"
    end

    bin.install_symlink libexec/"bin/meme"
  end

  test do
    system bin/"meme", prefix/"tests/common/At.s"
  end
end
