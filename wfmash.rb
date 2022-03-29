class Wfmash < Formula
  desc "A DNA sequence read mapper based on mash distances and the wavefront alignment algorithm"
  homepage "https://github.com/ekg/wfmash"
  url "https://github.com/ekg/wfmash/archive/refs/tags/v0.8.1.tar.gz"
  version "0.8.1"
  sha256 "c8b568b0b45023be130b7d96134c12105be1e62b43b07ff732c3dfba99747ca3"

  depends_on "zlib"
  depends_on "jemalloc"
  depends_on "gsl"
  depends_on "htslib"
  depends_on "gcc@11" => :build
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      # avoid system gcc
      system "cmake", "..", "-DCMAKE_C_COMPILER='gcc-11'", "-DCMAKE_CXX_COMPILER='g++-11'", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
      system "make"
      bin.install "bin/wfmash"
    end
  end

  test do
    system "#{bin}/wfmash", "--version"
  end
end
