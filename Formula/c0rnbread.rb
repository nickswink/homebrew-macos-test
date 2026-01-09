class C0rnbread < Formula
    desc "Test"
    homepage "https://github.com/nickswink/"
    url "https://github.com/nickswink/homebrew-macos-test/releases/download/release/c0rnbread-1.0.0.tar.gz"
    sha256 "1d44901a327773e0406423d858b7c13ac57680b8286bae25b8b206d6821c802e"
    version "1.0.0"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
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
