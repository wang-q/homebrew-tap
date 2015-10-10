# Documentation: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
#                http://www.rubydoc.info/github/Homebrew/homebrew/master/frames
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Scythe < Formula
  desc "Scythe - A Bayesian adapter trimmer"
  homepage "https://github.com/wang-q/scythe"
  url "https://github.com/wang-q/scythe/archive/0.994.tar.gz"
  version "0.994"
  sha256 "7576bcf7c4cc72c798713548cf36b30630f44ea047fa6e02b5cb2969abdcccf9"

  def install
    system "make"
    bin.install "scythe"
    doc.install "README.md"
  end

  test do
    system "#{bin}/scythe", "--version"
  end
end

