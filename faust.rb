class Faust < Formula
  desc "Functional AUdio STream is language for signal processing and synthesis."
  homepage "http://faust.grame.fr"
  option "with-faust0", "install faust 0.x.x not faust 2.x.x"
  depends_on "pkg-config" => :build
  if build.without? "faust0"
    depends_on "llvm@3.8" => :build
    depends_on "openssl" => :build
    url "https://github.com/grame-cncm/faust.git", :tag => "v2-1-0"
    head "https://github.com/grame-cncm/faust.git", :branch => "faust2"
  else
    url "https://github.com/grame-cncm/faust.git", :tag => "v0-9-90"
    head "https://github.com/grame-cncm/faust.git"
  end

  def install
    ENV["LDFLAGS"] = "-L/usr/local/opt/openssl/lib"
    ENV["CXXFLAGS"] = "-I/usr/local/opt/openssl/include"
    ENV["PKG_CONFIG_PATH"] = "/usr/local/bin/pkg-config"
    ENV["PKG_CONFIG_LIBDIR"] += ":/usr/local/opt/openssl/lib/pkgconfig"
    ENV["PATH"] += ":#{HOMEBREW_PREFIX}/bin"

    system "make"
    system "make", "install", "PREFIX=#{prefix}"
  end
  test do
    system "#{bin}/faust", "-v"
  end
end
