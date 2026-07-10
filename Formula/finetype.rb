class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.45"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.45/finetype-v0.6.45-aarch64-apple-darwin.tar.gz"
      sha256 "9ec11831e525d4db28a40ee3c43c8323b79afc75d393ad5cc3967331b6c115ea"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.45/finetype-v0.6.45-x86_64-apple-darwin.tar.gz"
      sha256 "c049d880057796ff5f2e77b7ab223d538d65555df78ea7dd0fc3988f624754c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.45/finetype-v0.6.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c0fe563ef078c5869fc7a859b48ab651af8fe3b9e4f1f0f80897d9c887cd236"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.45/finetype-v0.6.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2146988b570005f4d9724815c731418024492c7660fe07deaed9776ecc614831"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
