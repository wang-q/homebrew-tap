class MummerAT4 < Formula
  # cite Mar_ais_2018: "https://doi.org/10.1371/journal.pcbi.1005944"
  desc "Alignment of large-scale DNA and protein sequences"
  homepage "https://mummer4.github.io"
  url "https://github.com/mummer4/mummer/releases/download/v4.0.0rc1/mummer-4.0.0rc1.tar.gz"
  sha256 "85006adb2d6539c2f738c3e3bb14b58bb6f62cd6c6ca5ede884a87ae76e07d1d"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
    mv bin/"annotate", bin/"annotate-mummer"
  end

  test do
    system "#{bin}/nucmer"
  end
end
