class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.15/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "09340dd3732392e7a4c6f8e41532dc32643d9d56f8e516a42ef84b011a8459b8"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.15/intspan-x86_64-unknown-linux-musl.tar.gz"
        sha256 "dcec6d4b6f87f06af2378affbcead755b4b266e07bfd9473a475ba82d27debc6"
    end

    version "0.4.15"

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
