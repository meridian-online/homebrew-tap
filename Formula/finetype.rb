class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.50"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.50/finetype-v0.6.50-aarch64-apple-darwin.tar.gz"
      sha256 "a2e3dd15b19e89572e5c73b072a3c4a6b34d88749c6e094c830f943d77f0558a"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.50/finetype-v0.6.50-x86_64-apple-darwin.tar.gz"
      sha256 "90c7197ea7447f3679602b94e0bdba938afb2bfa7acd3ba3f32b31a7e25c4fde"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.50/finetype-v0.6.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26ca1013b3c4ac00ca0af9ffd5735ebf9709a57659188638c884ef657425d095"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.50/finetype-v0.6.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8c1fca3a6ddb0ee8b41bc0ac72da25962ad331c510d5200f75cc79e377557d5"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
