class Multiz < Formula
  desc "A strip-down version of multiz-tba"
  homepage "https://github.com/wang-q/multiz"
  url "https://github.com/wang-q/multiz/archive/v1.1.1.tar.gz"
  version "1.0"
  sha256 "839f6625085178e20c52dbe781e4cacf11cb06df7e4d6d3a3c69c787b6b0e104"

  def install
    system "make"
    bin.install %w[
      multiz
    ]
  end

  test do
    system "#{bin}/multiz"
  end
end
