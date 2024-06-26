class QuastAT520 < Formula
  desc "Quality Assessment Tool for Genome Assemblies"
  homepage "https://quast.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/quast/quast-5.2.0.tar.gz"
  sha256 "ccd911087cfa254ad4b8eadac4f95d4685e44c3996f5516b8e0ce6f7cfa7e0db"
  head "https://github.com/ablab/quast.git"

  depends_on "python"

  uses_from_macos "zlib"

  def install
    prefix.install Dir["*"]
    bin.install_symlink "../quast.py", "../metaquast.py", "../quast-lg.py", "../icarus.py",
      "quast.py" => "quast", "metaquast.py" => "metaquast", "quast-lg.py" => "quast-lg", "icarus.py" => "icarus"
    inreplace "#{bin}/../quast.py", "#!/usr/bin/env python", "#!/usr/bin/env python3"
    inreplace "#{bin}/../metaquast.py", "#!/usr/bin/env python", "#!/usr/bin/env python3"
    inreplace "#{bin}/../icarus.py", "#!/usr/bin/env python", "#!/usr/bin/env python3"

    # Compile the bundled aligner so that `brew test quast` does not fail.
    system "#{bin}/quast", "--test"
  end

  test do
    system "#{bin}/quast", "--test"
  end
end