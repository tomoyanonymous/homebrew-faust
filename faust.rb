class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis."
  homepage "http://faust.grame.fr"
  option "with-faust0", "install faust 0.x.x not faust 2.x.x.(don't require llvm and openssl.)"
  option "with-httpd", "compile httpdlib (requires GNU libmicrohttpd)"
  option "with-dynamic", "compile httpd & osc supports as dynamic libraries"
  option "with-sound2faust", "compile sound to DSP file converter"
  option "with-test", "install test suite"

  depends_on "pkg-config" => :run

  if build.without? "faust0"
    depends_on "llvm@3.8" => :run
    depends_on "openssl" => :run
    url "https://github.com/grame-cncm/faust/archive/v2-1-0.tar.gz"
    sha256 "9bd0b02020a6d9130ac3e2b11ad7cbfc03883769eb87dcb76251c80c40488494"
    head "https://github.com/grame-cncm/faust.git", :branch => "faust2"
  else
    if build.devel?
      url "https://github.com/grame-cncm/faust.git", :branch => "master-dev"
    else
      url "https://github.com/grame-cncm/faust/archive/v0-9-90.tar.gz"
    end
    sha256 "abb1dee52faf427d232f56f2037ba5e81cb60a9e6684ac10f41da6c5c6df3415"
    head "https://github.com/grame-cncm/faust.git", :branch => "master"
  end
  if build.with? "httpd"
    depends_on "libmicrohttpd" =>:run
  end
  if build.with? "sound2faust"
    depends_on "libsndfile" => :run
  end

  def install
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
