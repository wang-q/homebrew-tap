class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.7.0/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "d411f7105fa1c8b35679a5b6339f37f182dc29175b515bc63310afae346e4fd6"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.7.0/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "f81654345dee9c0fe7a3b8ce4821dfbd7d5f5a822f8ed2849e3918d4d1c0ff3a"
    end

    version "0.7.0"

    def install
        # already in target/
        if OS.mac?
            bin.install Dir["release/*"]
        elsif OS.linux?
            bin.install Dir["release/*"]
            # bin.install Dir["x86_64-unknown-linux-musl/release/*"]
        end
    end

    test do
        system "#{bin}/spanr help"
    end
end
