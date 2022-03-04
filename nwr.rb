class Nwr < Formula
    desc "`nwr` is a command line tool for newick and taxonomy "
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.5/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "91c0d1dde831aa99347407fe53dfe39f21f0a177fd6898fb80943aa584e4115d"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.5/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "cd7215ce3e87a24dd07212f5c4864656e90e635d94e38bea130a79ed183f57fc"
    end

    version "0.5.5"

    def install
        # already in target/
        if OS.mac?
            bin.install Dir["release/*"]
        elsif OS.linux?
            bin.install Dir["release/*"]
        end
    end

    test do
        system "#{bin}/nwr help"
    end
end
