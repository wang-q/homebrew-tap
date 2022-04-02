class TrfAT4 < Formula
  desc "Tandem Repeats Finder"
  homepage "https://github.com/Benson-Genomics-Lab/TRF"
  url "https://github.com/Benson-Genomics-Lab/TRF/archive/refs/tags/v4.09.1.tar.gz"
  sha256 "516015b625473350c3d1c9b83cac86baea620c8418498ab64c0a67029c3fb28a"

  def install
    mkdir "build" do
      system "../configure"
      system "make"
      bin.install "src/trf"
    end
  end

  test do
    system "#{bin}/trf"
  end
end
