class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-aarch64-apple-darwin.tar.gz"
      sha256 "5da5d54e0632a3b9d47bd3b8f1844c8555dc426e07d2d3bad0b1004e28cd2279"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-x86_64-apple-darwin.tar.gz"
      sha256 "ddf4a255d8b3f16db3f5b693c00b4b8c987f2385bfcf2985b30171c11d439e4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e1be1a6bc36c89cb032e27afde89dd7087056a88458176b0b194e507dc64e79e"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6846e77ec1a8defaf9ce3a58273ac764953bdbf9f9196c162625aa25a8313661"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
