class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/releases/download/2.5.23/faust-2.5.23.tar.gz"
  sha256 "d87ef98a7a25367c12f51fe1ebb07fe4f2c0b37f27b63b7bcd074273b295e5fb"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"

  option "with-web", "install with asmjs and wasm compiler(need emscripten)."
  option "with-ios", "install with ios libraly(only in head)"
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
  end
  test do
    cp_r "#{prefix}/tests/architecture-tests", testpath
    cd "#{testpath}/architecture-tests"
    system "./testfailure"
    cd "#{testpath}/architecture-tests"
    system "./testsuccess", "osx"
  end
end
