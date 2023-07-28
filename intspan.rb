class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.7.5/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "7a036c2ff00b5f5f819f6798c15a668c6f643c2c5de8326e8f0f5b74aed046d6"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.7.5/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "43e218942d345bf8ad436101dd3a439db7e4518527ad14d167051c31998106dd"
    end

    version "0.7.5"

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
