class Chainnet < Formula
  desc "Utilities for the UCSC Genome Browser"
  homepage "https://genome.ucsc.edu/"
  url "https://github.com/wang-q/chainNet/archive/v130.tar.gz"
  sha256 "bbbf1183e1fae4b44d4cf7dd89573d0d04b96bde2c99eb33b7ed8c8e52d04975"

  depends_on "libpng"
  depends_on "mysql@5.7"
  depends_on "openssl"
  unless OS.mac?
    depends_on "rsync"
    depends_on "util-linux"
    depends_on "zlib"
  end

  def install
    libpng = Formula["libpng"]
    mysql = Formula["mysql@5.7"]

    args = ["BINDIR=#{bin}", "SCRIPTS=#{bin}"]
    args << "MACHTYPE=#{`uname -m`.chomp}"
    args << "PNGLIB=-L#{libpng.opt_lib} -lpng -lz"
    args << "PNGINCL=-I#{libpng.opt_include}"
    args << "MYSQLLIBS=-L#{mysql.opt_lib} -lmysqlclient -lz"
    args << "MYSQLINC=#{mysql.opt_include}/mysql"

    system "make", *args
  end

  test do
    system "#{bin}/chainNet"
  end
end
