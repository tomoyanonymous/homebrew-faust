class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/archive/2.15.11.tar.gz"
  sha256 "4e6b8968679bd3f7b1a5fa47752ebc50b2a27ecb88004af181deee578131e42c"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"

  option "with-web", "install with  wasm compiler(need emscripten)."
  option "with-ios", "install with ios library"
  option "with-universal", "create universal binary"
  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "libmicrohttpd"
  depends_on "libsndfile"
  if build.with? "web"
    depends_on "emscripten" => :build
  end
  depends_on "llvm"
  depends_on "openssl"
  def install
    if build.with? "universal"
      system "make", "universal"
    end
    system "make", "all"
    if build.with? "web"
      system "make", "wasm"
    end
    if build.with? "ios"
      system "make", "ios"
    end
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
