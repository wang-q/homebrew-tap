class Bismark < Formula
  desc "Bismark: A tool to map bisulfite converted sequence reads and determine cytosine methylation states"
  homepage "https://www.bioinformatics.babraham.ac.uk/projects/bismark/"
  # doi "10.1093/bioinformatics/btr167"
  # tag "bioinformatics"

  url "https://www.bioinformatics.babraham.ac.uk/projects/bismark/bismark_v0.20.0.tar.gz"
  version "0.2.0"
  sha256 "4c3f0d9eb75c4bf099505c5a2c1f9a00c35a54cce3074c572f8d69ecb9831337"

  def install
    bin.install %w[bam2nuc bismark bismark2bedGraph bismark2report bismark2summary bismark_genome_preparation bismark_methylation_extractor coverage2cytosine deduplicate_bismark filter_non_conversion]
    doc.install "README.md"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/bismark --help 2>&1", 1)
  end
end
