class Multiz < Formula
  desc "A strip-down version of multiz-tba"
  homepage "https://github.com/wang-q/multiz"
  url "https://github.com/wang-q/multiz/archive/v1.0.tar.gz"
  version "1.0"
  sha256 "7bb6d4a99ec7d683843250d4e9871f32f5ca9e106a70ddd2f0f05c3aefc1c927"

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
