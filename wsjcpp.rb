class Wsjcpp < Formula
    desc "Yet one... C++ Package Manager"
    homepage "https://github.com/wsjcpp/wsjcpp"
    version "v0.0.1"
    url "https://github.com/wsjcpp/wsjcpp/archive/v0.0.1.tar.gz"
    sha256 "b09817105307d5bc70c55a14d5f74922472cebd797ab54146edc4814db5f296b"
    head "https://github.com/wsjcpp/wsjcpp.git", :branch => "master"
  
    depends_on "cmake"
    depends_on "curl-openssl"
    depends_on "pkg-config"

    def install
        system "cmake", "."
        system "make"

        system "cp", "-f", "./wsjcpp", "/usr/local/bin/"
    end
  end