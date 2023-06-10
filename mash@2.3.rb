class MashAT23 < Formula
  desc "Fast genome distance estimation using MinHash"
  homepage "https://github.com/marbl/Mash"
  if OS.mac?
    url "https://github.com/marbl/Mash/releases/download/v2.3/mash-OSX64-v2.3.tar"
    sha256 "3d3bfc37b8f943df6b15e4e85e5fd3550d3848ca1f26d3ff4e1f6d81d01b7a51"
  else
    url "https://github.com/marbl/Mash/releases/download/v2.3/mash-Linux64-v2.3.tar"
    sha256 "543a9b8b3e60a05a374e7566cc9f4838df186a80b4f16cd69e812841d0ba6582"
  end
  version "2.3"

  def install
    bin.install Dir["mash"]
  end

  test do
    assert_match "2.3", shell_output("#{bin}/mash --version")
  end
end
