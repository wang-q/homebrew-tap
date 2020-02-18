class TsvUtils < Formula
    desc "Command line utilities for tabular data files"
    homepage "https://github.com/eBay/tsv-utils"

    if OS.mac?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.5.0/tsv-utils-v1.5.0_osx-x86_64_ldc2.tar.gz"
        sha256 "00274bff7830db698fcf5d48d8fa274cee082845bdcb5956c9a485fa3c707c3c"
    elsif OS.linux?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.5.0/tsv-utils-v1.5.0_linux-x86_64_ldc2.tar.gz"
        sha256 "9c6ea552248087ef70e7705110ba4f9fe48d134b7eea94ba040f5cce16d25f81"
    end

    version "1.5.0"

    bottle :unneeded
  
    def install
        bin.install Dir["bin/*"]
    end
  
    test do
        system "#{bin}/tsv-pretty --help"
    end
end
