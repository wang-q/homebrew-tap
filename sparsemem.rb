class Sparsemem < Formula
  desc "A Practical Algorithm for Finding Maximal Exact Matches in Large Sequence Data Sets Using Sparse Suffix Arrays"
  homepage "https://github.com/wang-q/sparseMEM"
  url "https://github.com/wang-q/sparseMEM/archive/v1.0.0.tar.gz"
  version "1.0.0"
  sha256 "84a75514784ae4cc8151adaf16403a57dd3b0086cdfacd51e0777de8bd0cce4d"

  def install
    system "make"
    bin.install %w[
      sparsemem
    ]
  end

  test do
    system "#{bin}/sparsemem"
  end
end
