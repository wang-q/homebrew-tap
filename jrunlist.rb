class Jrunlist < Formula
  desc "`jrunlist` operates chromosome runlist files"
  homepage "https://github.com/egateam/jrunlist"
  url "https://oss.sonatype.org/content/groups/staging/com/github/egateam/jrunlist/0.1.7/jrunlist-0.1.7-jar-with-dependencies.jar"
  version "0.1.7"
  sha256 "f4509e40bcdb1b024ad49c2cfe8ce5ce39bfba9e00f1726c12cd49dbf983e7bd"

  def install
    libexec.install "jrunlist-0.1.7-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrunlist-0.1.7-jar-with-dependencies.jar", "jrunlist"
  end

  test do
    system "#{bin}/jrunlist --help"
  end
end
