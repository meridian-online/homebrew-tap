class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.33"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.33/finetype-v0.6.33-aarch64-apple-darwin.tar.gz"
      sha256 "e394831cb2b226ca4760eb38e29069ec9b6cad4aed5b88362cb0bf9ab8410fd8"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.33/finetype-v0.6.33-x86_64-apple-darwin.tar.gz"
      sha256 "67b6248dd85b5126d541a4adc184e065d792ec30a403e364a4e763ef31865ea2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.33/finetype-v0.6.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0325c8039f4970cb6e5132469b353fe82acac9c1e6f57e62b21e10bd99ccc94f"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.33/finetype-v0.6.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "51c7aa4b7777acd7072c83ba3e0372ffd385a686809d2c7c6833ad36e16da976"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
