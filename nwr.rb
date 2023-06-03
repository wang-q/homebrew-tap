class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.0/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "b51a53bb32db47606cd500699b2f82bcaa276c5c006f07ba3effd6d81c1f642b"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.0/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "833145a5b067e3e5c60bdd63a8a5897205da23a3814b6d078fb804a872e3af38"
    end

    version "0.5.10"

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
