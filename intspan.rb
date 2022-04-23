class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.7/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "e97489a8a74183f5406822823fc13b91e8d62ddf415e1285b853a6a0d007c183"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.7/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "49a66067096f0ddbc12d49f01259f354df7a6f3b9f62ae0b3cab7bbdfddaec50"
    end

    version "0.6.7"

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
