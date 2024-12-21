class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.8.0/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "d0c304fbb5c8f219ad49e6b8334eed69564c49ec66a0beb26b4129f8177788a3"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.8.0/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "53eaed7db343901ac2a373ec0e417c80f2d0f1a92e7691e41826a14f0a33a912"
    end

    version "0.8.0"

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
