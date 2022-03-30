class Seqwish < Formula
  desc "These sequences wish they were squished into a graph"
  homepage "https://github.com/ekg/seqwish"
  head "https://github.com/ekg/seqwish.git", :using => :git, :tag => 'v0.7.4'
  # The tarball doesn't include deps/
  # Submodules are cloned automatically.

  depends_on "zlib"
  depends_on "jemalloc"
  depends_on "gcc@11" => :build
  depends_on "cmake" => :build

  cmake_args = *std_cmake_args + %W[
    -DCMAKE_C_COMPILER='gcc-11'
    -DCMAKE_CXX_COMPILER='g++-11'
  ]

  def install
    mkdir "build" do
      # avoid system gcc
      # mkdir build && cd build
      # cmake .. -DCMAKE_C_COMPILER='gcc-11' -DCMAKE_CXX_COMPILER='g++-11' -DCMAKE_BUILD_TYPE=Release
      # make
      system "cmake", "..", *std_cmake_args
      system "make"
      bin.install "bin/seqwish"
    end
  end

  def caveats; <<~EOS
    Other versions of gcc may confuse cmake and cause linker errors.
    If this happens, remove something like `gcc@5`.
    EOS
  end

  test do
    system "#{bin}/seqwish", "--version"
  end
end
