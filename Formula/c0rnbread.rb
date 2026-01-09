class C0rnbread < Formula
    desc "Test"
    homepage "https://github.com/nickswink/"
    url "https://github.com/nickswink/homebrew-macos-test/releases/download/release/c0rnbread-1.0.0.tar.gz"
    sha256 "40582368251403514766df8c50c2ef94c7e8920b5f606551a0bb5841ad2295fe"
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
