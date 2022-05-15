class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.9/intspan-x86_64-apple-darwin.tar.gz"
        sha256 "433b581b24e70b027752afeb873d655c0b3fb7cbb0bc8b68bec0849e161885cc"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.6.9/intspan-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "55d542cb2c6c500735279d19054ae64609d78b8fca9e5de6617db60cbbb18026"
    end

    version "0.6.9"

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
