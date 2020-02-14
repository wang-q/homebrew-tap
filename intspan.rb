class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.10/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "ded7dd193bb9dfe6b55b0e3ff4deaea7334fb2740bd573de21de03e080d4a948"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.10/intspan-x86_64-unknown-linux-musl.tar.gz"
        sha256 "b456042d9b3bae9261bbf243a53a1a680c3efcb5c6714fabe22bf803258d9423"
    end

    version "0.4.10"

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
