class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.10/jrange-0.0.10-jar-with-dependencies.jar"
  version "0.0.10"
  sha256 "6b97c89cab0983687bff96fdbfb2460132cfc173a44eab9b42ce7fdfcafbee0b"

  def install
    libexec.install "jrange-0.0.10-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.10-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
