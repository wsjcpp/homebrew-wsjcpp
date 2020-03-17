class Wsjcpp < Formula
    desc "Yet one... C++ Package Manager"
    homepage "https://github.com/wsjcpp/wsjcpp"
    version "v0.0.2"
    url "https://github.com/wsjcpp/wsjcpp/archive/v0.0.2.tar.gz"
    sha256 "e8d135f31d1885c5edd9f615ae496021f4ec015b6536c502875bbc346deaa338"
    head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"
  
    depends_on "cmake"
    depends_on "curl-openssl"
    depends_on "pkg-config"
    depends_on :xcode
    
    bottle do
        cellar :any
        rebuild 1
    end
    
    def install
        bin.mkpath
        system "cmake", "-DCMAKE_INSTALL_PREFIX:PATH=#{prefix}" , "."
        system "make"
        system "cp", "./wsjcpp", "#{prefix}/bin/wsjcpp"
        bin.install_symlink
    end
  end
