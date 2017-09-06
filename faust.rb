class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis."
  homepage "http://faust.grame.fr"

  url "https://github.com/grame-cncm/faust/archive/v2-1-0.tar.gz"
  sha256 "9bd0b02020a6d9130ac3e2b11ad7cbfc03883769eb87dcb76251c80c40488494"
  head "https://github.com/grame-cncm/faust.git", :branch => "faust2"

  option "without-httpd", "don't compile httpdlib (requires GNU libmicrohttpd)"
  option "without-dynamic", "don't compile httpd & osc supports as dynamic libraries"
  option "without-sound2faust", "don't compile sound to DSP file converter"
  option "without-test", "don't install test suite"
  depends_on "pkg-config" => :run
  depends_on "llvm" => :run
  depends_on "openssl" => :run
  if build.with? "httpd"
    depends_on "libmicrohttpd" =>:run
  end
  if build.with? "sound2faust"
    depends_on "libsndfile" => :run
  end

  def install
    if !build.head?
      inreplace "compiler/Makefile.unix", "$(filter $(LLVM_VERSION), 4.0.0)", "$(filter $(LLVM_VERSION), 4.0.0 4.0.1)"
    end
    system "make"
    if build.with? "httpd"
      system "make", "httpd"
    end
    if build.with? "dynamic"
      system "make", "dynamic"
    end
    if build.with? "sound2faust"
      system "make", "sound2faust"
    end
    system "make", "install", "PREFIX=#{prefix}"
    if build.with? "test"
      cp_r "tests", prefix
    end
  end
  test do
    cp_r "#{prefix}/tests/architecture-tests", testpath
    cd "#{testpath}/architecture-tests"
    system "./testfailure"
    cd "#{testpath}/architecture-tests"
    system "./testsuccess", "osx"
  end
end
