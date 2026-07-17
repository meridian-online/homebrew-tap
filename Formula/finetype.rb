class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.53"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.53/finetype-v0.6.53-aarch64-apple-darwin.tar.gz"
      sha256 "f1366cee3350d3aa67ee92caf32510d35700698939501e3bf34b6ebd5f7300f4"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.53/finetype-v0.6.53-x86_64-apple-darwin.tar.gz"
      sha256 "b4a05243baac5af0d434c3ffcaedc155fda99c7d2808c63fc311e104be96b5a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.53/finetype-v0.6.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76b02961bb75f999dccf434306ea514f362891227405e155175a5b86277447db"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.53/finetype-v0.6.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0742bfd7c184ee87ce8ede222256bf0c37198a481caf2c62e789dc9107ea157f"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
