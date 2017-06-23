class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.9/jrange-0.0.9-jar-with-dependencies.jar"
  version "0.0.9"
  sha256 "603e42ca976b75405459c35be53c7079695e6bd687e81927e4d5c12b206f9920"

  def install
    libexec.install "jrange-0.0.9-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.9-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
