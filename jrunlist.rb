class Jrunlist < Formula
  desc "`jrunlist` operates chromosome runlist files"
  homepage "https://github.com/egateam/jrunlist"
  url "http://repo1.maven.org/maven2/com/github/egateam/jrunlist/0.1.4/jrunlist-0.1.4-jar-with-dependencies.jar"
  version "0.1.4"
  sha256 "a1d2e5bb83544267e20fc2738f91ad48d09e83c38e91a235a7fcfc0d762f91b7"

  def install
    libexec.install "jrunlist-0.1.4-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrunlist-0.1.4-jar-with-dependencies.jar", "jrunlist"
  end

  test do
    system "#{bin}/jrunlist --help"
  end
end
