class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.10/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "a852891f056ca1b1b71fb7a35a5a134d74cf6a2a365302aa7bca6e5ac49d4b77"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.10/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "5364469579ba93f8f656376546c85093e8f49f57223b2e7ecc462f410ed7aca2"
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
