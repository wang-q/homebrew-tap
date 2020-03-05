class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.12/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "f09db95ed83a96bc8992b2316698c1f644480767b43ccec4caebb2aaa6616e23"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.12/intspan-x86_64-unknown-linux-musl.tar.gz"
        sha256 "e7a085f663e5b1aab593d044f820b666cc950e6c323ebf5467d5d9acd8c37a2c"
    end

    version "0.4.12"

    bottle :unneeded

    def install
        # already in target/
        if OS.mac?
            bin.install Dir["release/*"]
        elsif OS.linux?
            bin.install Dir["x86_64-unknown-linux-musl/release/*"]
        end
    end

    test do
        system "#{bin}/spanr help"
    end
end
