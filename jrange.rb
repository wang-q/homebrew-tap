class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "http://repo1.maven.org/maven2/com/github/egateam/jrange/0.0.3/jrange-0.0.3-jar-with-dependencies.jar"
  version "0.0.3"
  sha256 "34208b249241ff95886d6851d44b215cfaebfae12d659f312ff68337a50b6d32"

  def install
    libexec.install "jrange-0.0.3-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.3-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
