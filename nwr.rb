class Nwr < Formula
    desc "`nwr` is a command line tool for newick and taxonomy "
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.3/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "a26545d111a0bb6729af1ea7ba49b1d61c420dfe6d03fc5192d81a5c7aedabeb"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.3/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "06862a896501d6863ee0d971a0b2744974d60cf699cef8e9981d3c470b6a38"
    end

    version "0.5.3"

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
