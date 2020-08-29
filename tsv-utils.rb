class TsvUtils < Formula
    desc "Command line utilities for tabular data files"
    homepage "https://github.com/eBay/tsv-utils"

    if OS.mac?
        url "https://github.com/eBay/tsv-utils/releases/download/v2.0.0/tsv-utils-v2.0.0_osx-x86_64_ldc2.tar.gz"
        sha256 "49f5a50c0a19789a6b2c78088a39ff889ff28c5bf1d63f1e9cc909748897388d"
    elsif OS.linux?
        url "https://github.com/eBay/tsv-utils/releases/download/v2.0.0/tsv-utils-v2.0.0_linux-x86_64_ldc2.tar.gz"
        sha256 "f2365778e5db6872d775456c99ec8565388c5d9aa75ebafff2c9c11d1d9a0ba2"
    end

    version "2.0.0"

    bottle :unneeded
  
    def install
        bin.install Dir["bin/*"]
        bin.install Dir["extras/scripts/*"]
    end
  
    test do
        system "#{bin}/tsv-pretty --help"
    end
end
