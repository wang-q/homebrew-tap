class TsvUtils < Formula
    desc "Command line utilities for tabular data files"
    homepage "https://github.com/eBay/tsv-utils"

    if OS.mac?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.2.1/tsv-utils-v1.2.1_osx-x86_64_ldc2.tar.gz"
        sha256 "a52f6acb864811a028579cc423d058120c3736e556cb4e5cbe19fe05b8f14e19"
    elsif OS.linux?
        url "https://github.com/eBay/tsv-utils/releases/download/v1.2.1/tsv-utils-v1.2.1_linux-x86_64_ldc2.tar.gz"
        sha256 "4922410a909d50648c583774195ad6e23883660f8053e968ec7ee230e5bf9f83"
    end

    version "1.2.1"

    bottle :unneeded
  
    def install
        bin.install Dir["bin/*"]
    end
  
    test do
        system "#{bin}/tsv-pretty --help"
    end
end
