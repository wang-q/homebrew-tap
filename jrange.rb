class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.4/jrange-0.0.4-jar-with-dependencies.jar"
  version "0.0.4"
  sha256 "2b969ff1891cd1541312b907462472f8004594ff80f7f74da00c33afddd8744d"

  def install
    libexec.install "jrange-0.0.4-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.4-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
