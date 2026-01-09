class C0rnbread < Formula
    desc "Test"
    homepage "https://github.com/nickswink/"
    url "https://github.com/nickswink/macos-test/releases/download/v1.0.0/c0rnbread-1.0.0.tar.gz"
    sha256 "82a786008b1aa76ce2c2874dd2b9c70f4167262748c65bc1dc36546afbb10e95"
    version "1.0.0"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "./install.sh"
    end

    def caveats
        <<~EOS
        To finish installation, add the following line to .zshrc or .bashrc  
  source #{bin}/completion.sh
Then reopen your terminal app
        EOS
    end
    end
