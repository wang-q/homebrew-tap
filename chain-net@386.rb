class ChainNetAT386 < Formula
  desc "Utilities for the UCSC Genome Browser"
  homepage "https://genome.ucsc.edu/"
  url "http://hgdownload.soe.ucsc.edu/admin/exe/userApps.v386.src.tgz"
  sha256 "b96cda9390873a814cf494c601fc0d93cc1c7d9db9908bdb37123bcc80a88a05"

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

    args = ["userApps", "BINDIR=bin", "SCRIPTS=bin"]
    args << "MACHTYPE=#{`uname -m`.chomp}"
    args << "PNGLIB=-L#{libpng.opt_lib} -lpng -lz"
    args << "PNGINCL=-I#{libpng.opt_include}"
    args << "MYSQLINC=#{mysql.opt_include}/mysql"
    args << "MYSQLLIBS=-lmysqlclient -lz"

    cd "kent/src" do
      inreplace "parasol/makefile", "DESTDIR=${HOME}/bin", ""
      system "make", *args
    end

    bin.install Dir["bin/*"]
  end

  test do
    (testpath/"test.fa").write <<~EOS
      >test
      ACTG
    EOS
    system "#{bin}/faOneRecord test.fa test > out.fa"
    compare_file "test.fa", "out.fa"
  end
end
