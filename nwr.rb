class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.4/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "a4d2bdd6d112da48b30ec4c85702642bce19e0de4a65aa7cbd24f6e6e0314520"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.4/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "eab335e7188daf3a9976ab72adc36e9ba36d7e296559faa3e163d3d098fb19d8"
    end

    version "0.6.4"

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
