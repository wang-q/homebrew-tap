class RepeatmaskerAT411 < Formula
  desc "Program that screens DNA sequences for interspersed repeats"
  homepage "http://www.repeatmasker.org/"
  url "http://repeatmasker.org/RepeatMasker/RepeatMasker-4.1.1.tar.gz"
  version "4.1.1"
  sha256 "a2934996efd0d4baf1247970b94a5dbf5979453f11de31a288b6c099a826240c"

  depends_on "blast"
  depends_on "brewsci/bio/rmblast"
  depends_on "brewsci/bio/trf"
  depends_on "hmmer"

  depends_on "perl"
  depends_on "cpanminus" => :build

  def install
    libexec.install Dir["*"]
    perl = HOMEBREW_PREFIX/"bin/perl"
    bin.install_symlink "../libexec/RepeatMasker"
    system "cpanm", "Text::Soundex"

    Dir.chdir libexec.to_s do
      system "perl",
        "configure",
        "-hmmer_dir=#{HOMEBREW_PREFIX}/bin",
        "-rmblast_dir=#{HOMEBREW_PREFIX}/bin",
        "-libdir=#{libexec}/Libraries",
        "-default_search_engine=rmblast"
    end
  end

  test do
    assert_match "options", shell_output("#{bin}/RepeatMasker")
  end
end
