class IntSpan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.1/intspan-macos-x64.tar.gz"
        sha256 "7ace1f71c8f1ab01e09ea04958f6ffece31f4b04a7e4fc2457d6c12dbea549e5"
    elsif OS.linux?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.1/intspan-linux-x64.tar.gz"
        sha256 "eb5cb55f32728693c6fe5148cafab91366396eee3495ea5e324a352e96ee0941"
    end

    version "0.4.1"

    bottle :unneeded

    def install
        bin.install Dir["target/release/*"]
    end

    test do
        system "#{bin}/spanr help"
    end
end
