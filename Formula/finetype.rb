class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.25/finetype-v0.6.25-aarch64-apple-darwin.tar.gz"
      sha256 "a3f957f29cd5d9702daae167cd8921ceb00bae7594e6800a6b70f3131c380678"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.25/finetype-v0.6.25-x86_64-apple-darwin.tar.gz"
      sha256 "6a1be144b4997ecb3101f5d50cca253e886b86e619dabd310c82277f493fee84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.25/finetype-v0.6.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "22014576bf311f6e4e20d64957ed68d516719c3fdd9b800eeff6c942c29bbec4"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.25/finetype-v0.6.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef62038cd4e8c4db2c41a23402173394b6b6995900d4809e53049dd0ed283c7e"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
