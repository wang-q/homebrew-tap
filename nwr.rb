class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.7/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "3e75073a8733ffa349354713661fca749f26d7597ee7127355937039b91d45f8"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.7/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "354224aa864ad5744cbc8d9cdfa8a58b5b4c4ef16cee178b98dad4315242fe25"
    end

    version "0.5.7"

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
