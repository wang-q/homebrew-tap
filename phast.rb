class Phast < Formula
  desc "PHylogenetic Analysis with Space/Time models"
  homepage "http://compgen.cshl.edu/phast/index.php"
  url "http://compgen.cshl.edu/phast/downloads/phast.v1_3.tgz"
  version "1.3"
  sha256 "189ffa04b5b19258b59a45baedca9b9d5546862bf701b20b66f7e77dbb3f3677"

  depends_on "pcre"

  def install
    inreplace "src/make-include.mk", "# vecLib on", "ifdef NOTSKIPIT\n# vecLib on"
    inreplace "src/make-include.mk", "# bypassed altogether", "endif"
    cd "src" do
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
  end

  test do
    system "#{bin}/phast"
  end
end
