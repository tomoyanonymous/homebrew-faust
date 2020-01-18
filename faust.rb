class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/releases/download/2.15.11/faust-2.15.11.tar.gz"
  sha256 "660816b7fa44da718868d895a82f18f4a441c347bc39afc20a651124f5711d5c"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libmicrohttpd" => :build
  depends_on "libsndfile" => :build
  depends_on "llvm" =>:build
  depends_on "openssl" => :build
  def install
    if build.with? "universal"
      system "make", "universal"
    end
    system "make", "all" , "JOBS=${HOMEBREW_MAKE_JOBS}"
    system "make", "install", "PREFIX=#{prefix}"
  end
  test do
    cp_r "#{prefix}/tests/architecture-tests", testpath
    cd "#{testpath}/architecture-tests"
    system "./testfailure"
    cd "#{testpath}/architecture-tests"
    system "./testsuccess", "osx"
  end
end
