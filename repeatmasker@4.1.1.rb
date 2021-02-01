class RepeatmaskerAT411 < Formula
  desc "Program that screens DNA sequences for interspersed repeats"
  homepage "http://www.repeatmasker.org/"
  url "http://repeatmasker.org/RepeatMasker-4.1.1.tar.gz"
  version "4.1.1"
  sha256 "a2934996efd0d4baf1247970b94a5dbf5979453f11de31a288b6c099a826240c"

  depends_on "hmmer"
  depends_on "wang-q/tap/rmblast@2.10.0"
  depends_on "brewsci/bio/trf"

  depends_on "perl"
  depends_on "cpanminus" => :build

  def install
    libexec.install Dir["*"]
    bin.install_symlink "../libexec/RepeatMasker"
    system "cpanm", "Text::Soundex"
  end

  def caveats
    <<~EOS
      RepeatMasker comes with a copy of the curated portion of Dfam ( Libraries/Dfam.h5 ).
      And it will work out-of-the box with this library. This is a small library ( at this time ).
      The default aligner is RMBlast. You may reconfigure RepeatMasker by running

      cd #{HOMEBREW_PREFIX}/Cellar/repeatmasker@4.1.1/4.1.1/libexec &&
      perl configure \
        -hmmer_dir=#{HOMEBREW_PREFIX}/bin \
        -rmblast_dir=#{HOMEBREW_PREFIX}/bin \
        -libdir=#{libexec}/Libraries \
        -trf_prgm=#{HOMEBREW_PREFIX}/bin/trf \
        -default_search_engine=rmblast
    EOS
  end

  test do
    assert_match "options", shell_output("#{bin}/RepeatMasker")
  end
end
