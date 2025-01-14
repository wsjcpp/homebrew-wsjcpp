class Wsjcpp < Formula
  desc "Yet another... C++ Package Manager"
  homepage "https://github.com/wsjcpp/wsjcpp"
  url "https://github.com/wsjcpp/wsjcpp/archive/v0.2.3.tar.gz"
  sha256 "84d7625abb7b6d3d05f9e9b19fcb3154ce106a07abac831f18b6c38333f7ef88"
  head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"

  bottle do
    # cellar :any
    rebuild 1
  end

  depends_on "cmake"
  depends_on "pkg-config"
  depends_on :xcode

  uses_from_macos "curl-openssl"
  
  def install
    bin.mkpath
    system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}", "."
    system "make"
    bin.install "wsjcpp"
    # system "cp", "./wsjcpp", "#{bin}/wsjcpp"
    bin.install_symlink
  end

  test do
    system bin/"wsjcpp", "version"
  end
end
