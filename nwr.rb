class Nwr < Formula
    desc "`nwr` is a command line tool for newick and taxonomy "
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.0/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "3399b802b4f2fd1b3836b8392eeec42a2f9e6f327e6a0c3ee6c288cb9c9b8bbf"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.0/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "556bbb4d51121ad29ff068b2bfef3bce6a64535dcc7e6e1e551ffe62859aadd0"
    end

    version "0.5.0"

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
