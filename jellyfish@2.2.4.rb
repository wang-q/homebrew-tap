class JellyfishAT224 < Formula
  desc "Fast, memory-efficient counting of DNA k-mers"
  homepage "http://www.genome.umd.edu/jellyfish.html"
  # doi "10.1093/bioinformatics/btr011"
  # tag "bioinformatics"

  url "https://github.com/gmarcais/Jellyfish/releases/download/v2.2.4/jellyfish-2.2.4.tar.gz"
  sha256 "d31a71477c638caaeeacbede644870a7be26aa786919f4dd722b0a8fadb7dd28"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/jellyfish", "--version"
  end
end
