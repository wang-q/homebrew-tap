class Rsem < Formula
  desc "RSEM: accurate quantification of gene and isoform expression from RNA-Seq dat"
  homepage "http://deweylab.biostat.wisc.edu/rsem/"
  url "https://github.com/deweylab/RSEM/archive/v1.2.22.tar.gz"
  version "1.2.22"
  sha256 "fc6f461502ea9c76fe70a84728131ec35997c0be367292275fc5b8883b46c890"

  def install
    system "make"
    inreplace "EBSeq/Makefile", "EBSeq :", ""
    inreplace "EBSeq/Makefile", "./install", ""
    system "make", "ebseq"
    system "Rscript", "EBSeq/install"
    bin.install %w[convert-sam-for-rsem extract-transcript-to-gene-map-from-trinity
      rsem-bam2readdepth rsem-bam2wig rsem-prepare-reference rsem-build-read-index rsem-preref
      rsem-calculate-credibility-intervals rsem-run-ebseq rsem-calculate-expression rsem-run-em
      rsem-control-fdr rsem-run-gibbs rsem-extract-reference-transcripts rsem-sam-validator
      rsem-gen-transcript-plots rsem-scan-for-paired-end-reads rsem-generate-data-matrix
      rsem-simulate-reads rsem-generate-ngvector rsem-synthesis-reference-transcripts
      rsem-get-unique rsem-tbam2gbam rsem-parse-alignments rsem-plot-model
      rsem_perl_utils.pm]
  end

  test do
    system "Rscript", "EBSeq/install"
    system "#{bin}/rsem-prepare-reference", "--help"
  end
end
