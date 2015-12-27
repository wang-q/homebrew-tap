class Sparsemem < Formula
  desc "A Practical Algorithm for Finding Maximal Exact Matches in Large Sequence Data Sets Using Sparse Suffix Arrays"
  homepage "https://github.com/wang-q/sparseMEM"
  url "https://github.com/wang-q/sparseMEM/archive/v1.0.1.tar.gz"
  version "1.0.1"
  sha256 "4d6f212d592bb312f3665474f11e9732fa30c37db601480ef0d2680ccfd3335f"

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
