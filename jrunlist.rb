class Jrunlist < Formula
  desc "`jrunlist` operates chromosome runlist files"
  homepage "https://github.com/egateam/jrunlist"
  url "http://repo1.maven.org/maven2/com/github/egateam/jrunlist/0.1.4/jrunlist-0.1.4-jar-with-dependencies.jar"
  version "0.1.4"
  sha256 "371dba693a58e96618255aa31dc72020b193888348707c8ad16a203c3e7eca3d"

  def install
    libexec.install "jrunlist-0.1.4-jar-with-dependencies.jar"
    bin.write_jar_script libexec/"jrunlist-0.1.4-jar-with-dependencies.jar", "jrunlist"
  end

  test do
    system "#{bin}/jrunlist --help"
  end
end
