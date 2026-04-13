class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.13/finetype-v0.6.13-aarch64-apple-darwin.tar.gz"
      sha256 "23a7757fdaf144c756f139cd05540569cfe8ab7702f2012840cfa1cf54c92ff9"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.13/finetype-v0.6.13-x86_64-apple-darwin.tar.gz"
      sha256 "d0a8c814fc935bd30a187700c3c9a5ddf719a442076db319dde9f3a37d4a54c3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.13/finetype-v0.6.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46d10cdc40829adbd5225ed5730ef2ea068c7a2f81b674e296305a06b4a81af6"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.13/finetype-v0.6.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ea01b39b197cb3a551c33dfb218cb36ea34721a52fbe5e34a2b62810551e36b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
