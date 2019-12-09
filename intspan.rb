class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.9/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "98da7af1d75be987bd856cda71f428bbd8e094acdd587a2a032d1895687f3669"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.9/intspan-x86_64-unknown-linux-musl.tar.gz"
        sha256 "b0bd4bba8bb0a3270665b64da0d07a7c98f25c323f451c5a808cd5271a4b27c0"
    end

    version "0.4.9"

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
