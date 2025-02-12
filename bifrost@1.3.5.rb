class BifrostAT135 < Formula
  # cite Holley_2019: "https://doi.org/10.1101/695338"
  desc "Construction, indexing and querying of colored/compacted de Bruijn graphs"
  homepage "https://github.com/pmelsted/bifrost"
  url "https://github.com/pmelsted/bifrost/archive/refs/tags/v1.3.5.tar.gz"
  sha256 "e1b2491328b0cc1a32e433a8a9780f05547fa4b8d674b58abdda9ac8809f5341"

  uses_from_macos "zlib"

  def install
    mkdir "build" do
      system "cmake", "..", "-DMAX_KMER_SIZE=128", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/Bifrost ", "--version"
  end
end
