class Hnsm < Formula
    desc "Homogeneous Nucleic acids Smart Matching"
    homepage "https://github.com/wang-q/hnsm"

    if OS.mac?
        url "https://github.com/wang-q/hnsm/releases/download/v0.1.10/hnsm-x86_64-apple-darwin.tar.gz"
        sha256 "925aacbd3fb4e6ee8618791c7080a10cacbe4e77097d602006043246572374c7"
    elsif OS.linux?
        url "https://github.com/wang-q/hnsm/releases/download/v0.1.10/hnsm-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "679263ba65e516ab52595eb12c9fb2267deb3a0ce96e3efd2bf7f5134e61b8a9"
    end

    version "0.1.10"

    def install
        # already in target/
        if OS.mac?
            bin.install Dir["release/*"]
        elsif OS.linux?
            bin.install Dir["release/*"]
        end
    end

    test do
        system "#{bin}/hnsm help"
    end
end
