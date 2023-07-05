class Wfmash < Formula
  desc "A DNA sequence read mapper based on mash distances and the wavefront alignment algorithm"
  homepage "https://github.com/ekg/wfmash"
  url "https://github.com/waveygang/wfmash/releases/download/v0.10.4/wfmash-v0.10.4.tar.gz"
  version "0.10.4"
  sha256 "c86015038e109e3de8cb2ac849514f822b1a0cbf64897f50d57d8ef2e9743d91"

  depends_on "zlib"
  depends_on "jemalloc"
  depends_on "gsl"
  depends_on "htslib"
  depends_on "gcc@13" => :build
  depends_on "cmake" => :build

  def install
    bin.install "scripts/paf2dotplot"
    bin.install "scripts/wfplot.R"

    cmake_args = *std_cmake_args + %W[
      -DCMAKE_C_COMPILER='gcc-13'
      -DCMAKE_CXX_COMPILER='g++-13'
    ]

    mkdir "build" do
      # avoid system gcc
      # mkdir build && cd build
      # cmake .. -DCMAKE_C_COMPILER='gcc-13' -DCMAKE_CXX_COMPILER='g++-13' -DCMAKE_BUILD_TYPE=Release
      # make
      system "cmake", "..", *cmake_args
      system "make"
      bin.install "bin/wfmash"
    end
  end

  def caveats; <<~EOS
    Other versions of gcc may confuse cmake and cause linker errors.
    If this happens, remove something like `gcc@5`.
    EOS
  end

  test do
    system "#{bin}/wfmash", "--version"
  end
end
