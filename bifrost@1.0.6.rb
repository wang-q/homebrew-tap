class BifrostAT106 < Formula
  # cite Holley_2019: "https://doi.org/10.1101/695338"
  desc "Construction, indexing and querying of colored/compacted de Bruijn graphs"
  homepage "https://github.com/pmelsted/bifrost"
  url "https://github.com/pmelsted/bifrost/archive/refs/tags/v1.0.6.4.tar.gz"
  sha256 "139c5a11ce5796cda7ea67ff2cd305392620d18364bd75368a9d87602ba16763"

  depends_on "cmake" => :build

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
