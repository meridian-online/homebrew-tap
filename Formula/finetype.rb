class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.65"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.65/finetype-v0.6.65-aarch64-apple-darwin.tar.gz"
      sha256 "849d547d95cfb5f67c46b58b6647c51e9ceb7f9257fd44b234919f783021ff7b"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.65/finetype-v0.6.65-x86_64-apple-darwin.tar.gz"
      sha256 "93d5c47812415dfa3b342b50d833d8bd3be80d8f0ca90a5c46e3e959a7b2548c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.65/finetype-v0.6.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ad22f078b702db02849bb9d6da55d1b6a40bb491c24de45f7b35085f04d47b1"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.65/finetype-v0.6.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ddeae282b01bb9cb8ae0cbd171a0de53fa60edcaacc45e9c4f7b7bbaf803dc0"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
