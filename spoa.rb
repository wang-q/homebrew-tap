class Spoa < Formula
  desc "PHylogenetic Analysis with Space/Time models"
  homepage "https://github.com/rvaser/spoa"
  url "https://github.com/rvaser/spoa/releases/download/4.0.7/spoa-v4.0.7.tar.gz"
  version "4.0.7"
  sha256 "f7a8cd039e4aabea1481e123387fedaa8f87e55418a3649408a615f5c6b1b9a4"

  depends_on "zlib"
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      # "-DCMAKE_BUILD_TYPE=Release" comes with *std_cmake_args
      system "cmake", "..", "-Dspoa_build_executable=ON", "-Dspoa_optimize_for_portability=ON", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/spoa", "--version"
  end
end
