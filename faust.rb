class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/releases/download/2.20.2/faust-2.20.2.tar.gz"
  sha256 "c32588ee60d0f7ca25034d3d5436def6b35495f4d3beb3b02208d48684bcfbe9"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libmicrohttpd" => :build
  depends_on "libsndfile" => :build
  depends_on "llvm" =>:build
  depends_on "openssl" => :build
  def install
    opoo "Faust is now available from homebrew-core repo. Please just use `brew install faust`."
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
