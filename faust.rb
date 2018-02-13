class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis"
  homepage "http://faust.grame.fr"
  url "https://github.com/grame-cncm/faust/releases/download/2.5.21/faust-2.5.21.tar.gz"
  sha256 "6de2214316f9137cabf95bf075a599963cfe5305ab83d944e869bec417956f2f"
  head "https://github.com/grame-cncm/faust.git", :branch => "master-dev"

  option "with-web", "will install asmjs and wasm compiler."
  option "with-ios", "will not install ios and ios-llvm compiler."
  option "with-universal", "create universal binary"

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
      system "make", "sound2faust"
      system "make", "httpd"
      system "make", "dynamic"
    else
      system "make", "world"
    end
    if build.with? "web"
      system "make", "asmjs"
      system "make", "wasm"
    end
    if build.with? "ios"
      system "make", "ios"
      system "make", "ios-llvm"
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
