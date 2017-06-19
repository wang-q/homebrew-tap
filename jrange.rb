class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.5/jrange-0.0.5-jar-with-dependencies.jar"
  version "0.0.5"
  sha256 "a8b2e2c3faeaa15a7f07569cca1f488024b4e60afb381a1050f09a806a0d85c5"

  def install
    libexec.install "jrange-0.0.5-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.5-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
