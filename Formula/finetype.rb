class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.40"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.40/finetype-v0.6.40-aarch64-apple-darwin.tar.gz"
      sha256 "e117bf8171da2a1ae60bcab76e1beacffbbed5534c82d7c10acae403a4c874d0"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.40/finetype-v0.6.40-x86_64-apple-darwin.tar.gz"
      sha256 "5023fb10a865b563c14ddaae3ec640e6ac9355faecd6909555cd32dc9964b5d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.40/finetype-v0.6.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b0e9f63c64be0fcec061aeb2d9cd628a3c456cbdea12acc41a39ba1bfd82c8dc"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.40/finetype-v0.6.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5719fc06217b95711383cde151fdda959a97a919a944bcefd21ad2436e2790f3"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
