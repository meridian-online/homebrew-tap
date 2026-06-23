class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.36"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.36/finetype-v0.6.36-aarch64-apple-darwin.tar.gz"
      sha256 "9baf51930b900382163f550a5cc9862eb9606b0d88dee777ac8dee4516c087e4"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.36/finetype-v0.6.36-x86_64-apple-darwin.tar.gz"
      sha256 "6ffb59e8a7271d54f74e7a3ca564e7d2a4365dfafd7a1f81ff75862b34e51fff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.36/finetype-v0.6.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c80cad934776d8604a8c4f0590c8a688022928aebac52069babed7216368430"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.36/finetype-v0.6.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52c232bb7446586317a57a9a7e436d6a5320f3636198071a812e696c41bd5625"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
