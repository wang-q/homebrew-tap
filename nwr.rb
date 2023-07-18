class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.1/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "2e7a5e547c069d0112d3c9b272261b58da6d06f723e55dee193507551c8c98eb"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.1/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "372f0393a9f96804e8545e75601c4bc1d5c2362e0eb1e0cbfd99bf7b7886b063"
    end

    version "0.6.1"

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
