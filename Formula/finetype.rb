class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.28/finetype-v0.6.28-aarch64-apple-darwin.tar.gz"
      sha256 "206dbf97f68c87d55077746ac723ff1024ea2ad614685700aaa05b1df4cf391a"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.28/finetype-v0.6.28-x86_64-apple-darwin.tar.gz"
      sha256 "88ca7c6442875f37c5a4ef697157829719a5f7180a014f76d22a863a0a2c7bcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.28/finetype-v0.6.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56f972b09638b51827023d89322bf8d97f3e99e00bb643fc7b4addc970b287e2"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.28/finetype-v0.6.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e45330f94bb940ce0c2f8ce9a8d88aac74cc020acd2d1cb1eb243b7248c23d5c"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
