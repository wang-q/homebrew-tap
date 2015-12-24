class Multiz < Formula
  desc "A strip-down version of multiz-tba"
  homepage "https://github.com/wang-q/multiz"
  url "https://github.com/wang-q/multiz/archive/v1.1.tar.gz"
  version "1.0"
  sha256 "a51a2fcda4854082b2480080db3fce2484ec1416251533a98f8d68d4c3b78f5f"

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
