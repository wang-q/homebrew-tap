class TsvUtils < Formula
    desc "Command line utilities for tabular data files"
    homepage "https://github.com/eBay/tsv-utils"

    if OS.mac?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.6.0/tsv-utils-v1.6.0_osx-x86_64_ldc2.tar.gz"
        sha256 "d25f7c17612940be577eecb6431e70024f92ea5fba60444523d4d61f14f041eb"
    elsif OS.linux?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.6.0/tsv-utils-v1.6.0_linux-x86_64_ldc2.tar.gz"
        sha256 "a5810e07afd48c7b4f26dfe5c7479dff3b08d3dfcb52f7c72ec227441f724e40"
    end

    version "1.6.0"

    bottle :unneeded
  
    def install
        bin.install Dir["bin/*"]
        bin.install Dir["extras/scripts/*"]
    end
  
    test do
        system "#{bin}/tsv-pretty --help"
    end
end
