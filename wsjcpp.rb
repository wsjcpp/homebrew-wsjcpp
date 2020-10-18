class Wsjcpp < Formula
  desc "Yet another... C++ Package Manager"
  homepage "https://github.com/wsjcpp/wsjcpp"
  url "https://github.com/wsjcpp/wsjcpp/archive/v0.2.0.tar.gz"
  sha256 "74e541d1259be53624f74463080884e906152a168a1a4c4a55aa3c22b21468dc"
  head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"

  bottle do
    cellar :any
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
