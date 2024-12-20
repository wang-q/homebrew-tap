class Hnsm < Formula
    desc "Homogeneous Nucleic acids/amino acids Smart Matching"
    homepage "https://github.com/wang-q/hnsm"

    if OS.mac?
        url "https://github.com/wang-q/hnsm/releases/download/v0.2.0/hnsm-x86_64-apple-darwin.tar.gz"
        sha256 "0cfa69a2c6b935ae3d5a4f1ff1e9d0505a2ec26019d4d053fde3a453a11024be"
    elsif OS.linux?
        url "https://github.com/wang-q/hnsm/releases/download/v0.2.0/hnsm-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "e506c44aae908a303c3c2518bde532f07ea3b23fcd4f06497e03d1364daecb24"
    end

    version "0.2.0"

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
