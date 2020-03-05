class Wsjcpp < Formula
    desc "Yet one... C++ Package Manager"
    homepage "https://github.com/wsjcpp/wsjcpp"
    version "v0.0.1"
    url "https://github.com/wsjcpp/wsjcpp/archive/v0.0.1.tar.gz"
    sha256 "2495662e5b4ac15b628cd18bfbb4f6f016f71fff67e6e98d9d0cf16980bcf6fd"
    head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"
  
    depends_on "cmake"
    depends_on "curl-openssl"
    depends_on "pkg-config"

    def install
        system "cmake", "."
        system "make", "install"
    end
  end
