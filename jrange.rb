class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.7/jrange-0.0.7-jar-with-dependencies.jar"
  version "0.0.7"
  sha256 "966f7c63352cd5e16c299fde65952c16377bf761d1a518f3e55e88419f2cdab2"

  def install
    libexec.install "jrange-0.0.7-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.7-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
