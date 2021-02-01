class CircosAT0699 < Formula
  # cite Krzywinski_2009: "https://doi.org/10.1101/gr.092759.109"
  desc "Visualize data in a circular layout"
  homepage "http://circos.ca"
  url "http://circos.ca/distribution/circos-0.69-9.tgz"
  sha256 "34d8d7ebebf3f553d62820f8f4a0a57814b610341f836b4740c46c3057f789d2"
  version "0.69.9"

  depends_on "gd"

  depends_on "perl"
  depends_on "cpanminus" => :build
  depends_on "pkg-config" => :build

  def install
    rm "bin/circos.exe"
    inreplace "bin/gddiag", "#!/bin/env", "#!/usr/bin/env"

    libexec.install Dir["*"]
    bin.install_symlink "../bin/circos"

    system "cpanm", "Clone", "Config::General","Font::TTF::Font","GD", "List::MoreUtils", "Params::Validate", "Readonly", "Regexp::Common"
    system "cpanm", "Math::Round", "Math::Bezier", "Math::VecStat", "Number::Format", "Statistics::Basic"
    system "cpanm", "SVG", "Set::IntSpan", "Text::Balanced", "Text::Format"
  end

  test do
    system bin/"circos", "-conf", libexec/"example/etc/circos.conf", "-debug_group", "summary,timer"
    assert_predicate testpath/"circos.png", :exist?
    assert_predicate testpath/"circos.svg", :exist?
  end
end
