class KmergenieAT17051 < Formula
  # cite Chikhi_2013: "https://doi.org/10.1093/bioinformatics/btt310"
  desc "Estimates the best k-mer length for genome de novo assembly"
  homepage "http://kmergenie.bx.psu.edu/"
  url "http://kmergenie.bx.psu.edu/kmergenie-1.7051.tar.gz"
  sha256 "13148e5a2c700359cffca363b66ffa8f23c5db6af6eec03f739139ffdfee763f"

  depends_on "ntcard"

  def install
    args = ["k=121"]
    args << "osx=1" if OS.mac?
    system "make", "specialk", *args

    prefix.install "kmergenie", "readfq.py", "specialk", "scripts", "third_party"
    (prefix/"ntCard").install_symlink Formula["ntcard"].bin/"ntcard"
    bin.install_symlink prefix/"kmergenie", prefix/"specialk"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/kmergenie --help")
    assert_match "usage", shell_output("#{bin}/specialk 2>&1")

    if which("Rscript")
      (testpath/"test.fa").write <<~EOS
        >1
        AAAAAACCCCCCGGGGGGTTTTTT
      EOS
      assert_match "No best k found", shell_output("#{bin}/kmergenie test.fa 2>&1", 1)
    end
  end
end
