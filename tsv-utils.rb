class TsvUtils < Formula
    desc "Command line utilities for tabular data files"
    homepage "https://github.com/eBay/tsv-utils"

    if OS.mac?
        url "https://github.com/eBay/tsv-utils/releases/download/v2.1.1/tsv-utils-v2.1.1_osx-x86_64_ldc2.tar.gz"
        sha256 "af35f490820d6c1d4044f439560e465e4b1c2288f454cfc0efc3d1aac7ce037e"
    elsif OS.linux?
        url "https://github.com/eBay/tsv-utils/releases/download/v2.1.1/tsv-utils-v2.1.1_linux-x86_64_ldc2.tar.gz"
        sha256 "2fbd9762a4fc3c445d8a6af7663b200ae885fe0d399a461d5b44a648fd778a89"
    end

    version "2.1.1"

    def install
        bin.install Dir["bin/*"]
        bin.install Dir["extras/scripts/*"]
    end
  
    test do
        system "#{bin}/tsv-pretty --help"
    end
end
