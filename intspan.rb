class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.11/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "820c7cf46afe83a084b5577ee33ad3960fbaaf48456320a6a0b751a9aebd4dc9"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.11/intspan-x86_64-unknown-linux-musl.tar.gz"
        sha256 "0211c87dc19641fec241fa8def26abfcbb606e906dce357941db0686ae5cee01"
    end

    version "0.4.11"

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
