class Reaper < Formula
  desc "Demultiplexing, trimming and filtering sequencing data"
  homepage "http://www.ebi.ac.uk/~stijn/reaper/reaper.html"
  url "http://www.ebi.ac.uk/~stijn/reaper/src/reaper-16-098.tgz"
  version "16.098"
  sha256 "1d9263a68f682d37c78b2754d91c47aa44f45e3f0e4cc0ee4bc808616c51ff38"

  def install
    cd "src" do
      system "make"
      bin.install %w[minion reaper swan tally]
    end
  end

  test do
    system "#{bin}/tally -h"
  end
end
