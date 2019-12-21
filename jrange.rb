class Jrange < Formula
  desc "`jrange` operates ranges and links of ranges on chromosomes"
  homepage "https://github.com/egateam/jrange"
  url "https://repo1.maven.org/maven2/com/github/egateam/jrange/0.0.11/jrange-0.0.11-jar-with-dependencies.jar"
  version "0.0.11"
  sha256 "1b949d389c85d9a71e96d457ddac264b750c307407901add5427d0cdd519a574"

  def install
    libexec.install "jrange-0.0.11-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrange-0.0.11-jar-with-dependencies.jar", "jrange"
  end

  test do
    system "#{bin}/jrange --help"
  end
end
