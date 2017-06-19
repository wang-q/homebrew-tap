class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.6/jrange-0.0.6-jar-with-dependencies.jar"
  version "0.0.6"
  sha256 "02657e6195b1a9ee472aa1d67e55b267021444252ab8dcc708c7fa3d131fa568"

  def install
    libexec.install "jrange-0.0.6-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.6-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
