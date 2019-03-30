class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/archive/2.15.10.tar.gz"
  sha256 "0c8aa41fbbb51569bd1f15ea4556d96b97894b0f2107959dddcb8d68512443f6"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"

  option "with-web", "install with asmjs and wasm compiler(need emscripten)."
  option "with-ios", "install with ios library(only in head)"
  option "with-universal", "create universal binary(only in head)"

  depends_on "cmake" => :build
  depends_on "pkg-config" => :build
  depends_on "llvm"
  depends_on "openssl"
  depends_on "libmicrohttpd"
  depends_on "libsndfile"
  if build.with? "web"
    depends_on "emscripten" => :build
  end

  def install
    if build.with? "universal"
      system "make", "universal"
    end
    system "make", "all"
    if build.with? "web"
      system "make", "wasm"
      system "make", "asmjs"
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
