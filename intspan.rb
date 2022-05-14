class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.8/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "b27b2daedf7723276805cc2e517abec9d248468fc3ac3b1d5ddd2791d56767d4"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.8/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "7d6fc1ef2bb196591f497db5b91aa2c91777e40cf8fc6e192bde0b94566338aa"
    end

    version "0.6.8"

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
