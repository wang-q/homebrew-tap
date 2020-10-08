class Spoa < Formula
  desc "PHylogenetic Analysis with Space/Time models"
  homepage "https://github.com/rvaser/spoa"
  url "https://github.com/rvaser/spoa/releases/download/4.0.3/spoa-v4.0.3.tar.gz"
  version "4.0.3"
  sha256 "c88848b35f1350748ba45422f08e6e7a788fcc0d241b9fa3704ebb6b73e9d6e8"

  depends_on "zlib"
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      system "cmake", "..", "-Dspoa_build_executable=ON", "-DCMAKE_BUILD_TYPE=Release", "-Dspoa_optimize_for_portability=ON", *std_cmake_args
      system "make"
      system "make", "install"
    end
  end

  test do
    system "#{bin}/spoa", "--version"
  end
end
