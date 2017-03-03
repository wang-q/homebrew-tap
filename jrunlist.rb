class Jrunlist < Formula
  desc "`jrunlist` operates chromosome runlist files"
  homepage "https://github.com/egateam/jrunlist"
  url "http://repo1.maven.org/maven2/com/github/egateam/jrunlist/0.1.5/jrunlist-0.1.5-jar-with-dependencies.jar"
  version "0.1.5"
  sha256 "3c1d078235aa468795252f7a3f3027c90e564e6b3aaff35c269ec58b31b6e1dc"

  def install
    libexec.install "jrunlist-0.1.5-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrunlist-0.1.5-jar-with-dependencies.jar", "jrunlist"
  end

  test do
    system "#{bin}/jrunlist --help"
  end
end
