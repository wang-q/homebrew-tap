class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrange/0.0.8/jrange-0.0.8-jar-with-dependencies.jar"
  version "0.0.8"
  sha256 "3d77dad1c06f1fe31da1522e35cd31fd4227c4ddfdb34328aef5d42980e73022"

  def install
    libexec.install "jrange-0.0.8-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.8-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
