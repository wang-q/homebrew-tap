class Jrunlist < Formula
  desc "`jrunlist` operates chromosome runlist files"
  homepage "https://github.com/egateam/jrunlist"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrunlist/0.1.7/jrunlist-0.1.7-jar-with-dependencies.jar"
  version "0.1.7"
  sha1 "de0642c39c2e163f088560e564d41a3aab365f32"

  def install
    libexec.install "jrunlist-0.1.7-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrunlist-0.1.7-jar-with-dependencies.jar", "jrunlist"
  end

  test do
    system "#{bin}/jrunlist --help"
  end
end
