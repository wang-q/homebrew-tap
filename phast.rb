class Phast < Formula
  desc "PHylogenetic Analysis with Space/Time models"
  homepage "http://compgen.cshl.edu/phast/index.php"
  url "http://compgen.cshl.edu/phast/downloads/phast.v1_3.tgz"
  version "1.3"
  sha256 "189ffa04b5b19258b59a45baedca9b9d5546862bf701b20b66f7e77dbb3f3677"

  depends_on "pcre"

  def install
    cd "src" do
      system "make"
    end
    bin.install Dir["bin/*"]
    lib.install Dir["lib/*"]
  end

  test do
    system "#{bin}/phast"
  end
end

__END__
diff --git a/make-include.mk b/make-include.mk
index 5a5c965..a681af0 100644
--- a/make-include.mk
+++ b/make-include.mk
@@ -89,37 +89,37 @@ endif
 # phastCons, exoniphy, and phyloFit) will not be usable.

 # vecLib on Mac OS X; uncomment to use
-ifeq ($(TARGETOS), Darwin)
-  VECLIB = T
-endif
+#ifeq ($(TARGETOS), Darwin)
+#  VECLIB = T
+#endif

 # separately installed CLAPACK; uncomment CLAPACKPATH definition and
 # set appropriately to use, or define CLAPACKPATH when you run 'make'
-ifndef VECLIB
-  # platform-specific suffix used for CLAPACK libraries; use the same
-  #value as in CLAPACK's "make.inc" file
-ifneq ($(TARGETOS), Windows)
-  ifndef CLAPACKPATH
-    CHECKFILE = $(shell if [ -d /usr/local/software/clapack ]; then echo "true"; fi)
-    ifeq ($(CHECKFILE),true )
-      CLAPACKPATH = /usr/local/software/clapack
-    endif
-  endif
-    ifndef CLAPACKPATH
-      CLAPACKPATH = /usr/local/software/clapack
-    endif
-    #Automatically detects PLAT type by looking in CLAPACKPATH for blas*.a and extracts the * part
-    PLAT = $(shell find ${CLAPACKPATH}/ -name '*.a' -exec expr match {} '.*blas\(.*\).a' \; | tr -d "\n")
-  else
-    ifndef CLAPACKPATH
-	    CLAPACKPATH = /usr/local/software/clapack-windows
-    endif
-    # PLAT is empty for windows builds
-    PLAT =
-  endif
-  # F2C libraries used by CLAPACK; most users won't need to edit
-  F2CPATH = ${CLAPACKPATH}/F2CLIBS
-endif
+#ifndef VECLIB
+#  # platform-specific suffix used for CLAPACK libraries; use the same
+#  #value as in CLAPACK's "make.inc" file
+#ifneq ($(TARGETOS), Windows)
+#  ifndef CLAPACKPATH
+#    CHECKFILE = $(shell if [ -d /usr/local/software/clapack ]; then echo "true"; fi)
+#    ifeq ($(CHECKFILE),true )
+#      CLAPACKPATH = /usr/local/software/clapack
+#    endif
+#  endif
+#    ifndef CLAPACKPATH
+#      CLAPACKPATH = /usr/local/software/clapack
+#    endif
+#    #Automatically detects PLAT type by looking in CLAPACKPATH for blas*.a and extracts the * part
+#    PLAT = $(shell find ${CLAPACKPATH}/ -name '*.a' -exec expr match {} '.*blas\(.*\).a' \; | tr -d "\n")
+#  else
+#    ifndef CLAPACKPATH
+#	    CLAPACKPATH = /usr/local/software/clapack-windows
+#    endif
+#    # PLAT is empty for windows builds
+#    PLAT =
+#  endif
+#  # F2C libraries used by CLAPACK; most users won't need to edit
+#  F2CPATH = ${CLAPACKPATH}/F2CLIBS
+#endif

 # if neither VECLIB nor CLAPACKPATH is defined, then LAPACK will be
 # bypassed altogether
