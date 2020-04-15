class Wsjcpp < Formula
  desc "Yet another... C++ Package Manager"
  homepage "https://github.com/wsjcpp/wsjcpp"
  url "https://github.com/wsjcpp/wsjcpp/archive/v0.1.3.tar.gz"
  sha256 "1dc9f6053d50ccf9ec1ae6767db49c8333393a7c97b759185b3eb2cafbd4a451"
  head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"

  bottle do
    cellar :any
    rebuild 1
  end

  depends_on "cmake"
  depends_on "curl-openssl"
  depends_on "pkg-config"
  depends_on :xcode

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
