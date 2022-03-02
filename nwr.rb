class Nwr < Formula
    desc "`nwr` is a command line tool for newick and taxonomy "
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.4/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "c48b92b9c22b93a10ff1e2b6af1c741f23308ac5985ded88a872d790b74ff4b5"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.5.4/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "682eb3df2bc81133097f2f24558bd895644a4849ea27947bd1224d23987cae87"
    end

    version "0.5.4"

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
