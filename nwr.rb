class Nwr < Formula
    desc "`nwr` is a command line tool for NCBI taxonomy and newick files"
    homepage "https://github.com/wang-q/nwr"

    if OS.mac?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.5/nwr-x86_64-apple-darwin.tar.gz"
        sha256 "bbd3a729c516c3095db56b7f9c442079828b4655d4900f0ee3abef142ed826e0"
    elsif OS.linux?
        url "https://github.com/wang-q/nwr/releases/download/v0.6.5/nwr-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "167ed23dc6f6537c8829566b87c5569cedd5ff5eb0a6dfe73b9c0f0861bceb9c"
    end

    version "0.6.5"

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
