class Intspan < Formula
    desc "Command line tools for IntSpan related bioinformatics operations"
    homepage "https://github.com/wang-q/intspan"

    if OS.mac?
        url "https://github.com/wang-q/intspan/releases/download/v0.4.1/intspan-macos-x64.tar.gz"
        sha256 "464baa143eae0888f94cb903452f5690559971535ec7762fd9de6b5423fea86a"
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
