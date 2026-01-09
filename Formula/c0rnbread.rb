class C0rnbread < Formula
    desc "Test"
    homepage "https://github.com/nickswink/"
    url "https://github.com/nickswink/homebrew-macos-test/releases/download/release/c0rnbread-1.0.0.tar.gz"
    sha256 "91a2a85ce5d0e7511daa4bfc22e87df2fe1bf67ff3d7fc9769d90b1193e95eea"
    version "1.0.0"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end

        system "brew", "install", "docker"
        system "brew", "install", "docker-compose"
    end

    def post_install
        system "#{bin}/install.sh"
    end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
