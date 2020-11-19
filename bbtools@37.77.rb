class BbtoolsAT3777 < Formula
  desc "Suite of Brian Bushnell's tools for manipulating reads"
  homepage "https://jgi.doe.gov/data-and-tools/bbtools/"
  url "https://downloads.sourceforge.net/project/bbmap/BBMap_37.77.tar.gz"
  sha256 "3004c14dace43d35f4a89bf5fdaa5a2a9fab1630e173e801da9ea386cb166e96"

  depends_on java: "1.7+"

  def install
    if OS.mac?
      system "make", "--directory=jni", "-f", "makefile.osx"
    elsif OS.linux?
      system "make", "--directory=jni", "-f", "makefile.linux"
    end
    prefix.install %w[current jni resources]
    # shell scripts look for ./{current,jni,resources} files, so keep shell scripts
    # in ./#{prefix} but place symlinks in the ../bin dir for brew to export #{bin}
    bin.mkpath
    prefix.install Dir["*.sh"]
    bin.install_symlink Dir["#{prefix}/*.sh"]
    doc.install %w[license.txt README.md docs/changelog.txt docs/Legal.txt docs/readme.txt docs/ToolDescriptions.txt]
  end

  test do
    res = prefix/"resources"
    args = %W[in=#{res}/sample1.fq.gz in2=#{res}/sample2.fq.gz out=R1.fastq.gz out2=R2.fastq.gz ref=#{res}/phix174_ill.ref.fa.gz k=31 hdist=1]
    system "#{bin}/bbduk.sh", *args
    assert_match "bbushnell@lbl.gov", shell_output("#{bin}/bbmap.sh")
    assert_match "maqb", shell_output("#{bin}/bbmap.sh --help 2>&1")
    assert_match "minkmerhits", shell_output("#{bin}/bbduk.sh --help 2>&1")
  end
end
