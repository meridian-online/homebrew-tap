class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.44"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.44/finetype-v0.6.44-aarch64-apple-darwin.tar.gz"
      sha256 "c01340916a234f63d589a0202ab6c46982dc8fbe9dfceb15515988135ae3e4a1"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.44/finetype-v0.6.44-x86_64-apple-darwin.tar.gz"
      sha256 "a76d6d0f1c8edf42d3ced7bd149e022d6e9cc0b4b1f4fa2ed97639913d270194"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.44/finetype-v0.6.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c75694a1075bb1403b9a20b4ed3019248ff1c803a226aabe21c52bd7597307fa"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.44/finetype-v0.6.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a590193f2ac167150f593be0daacc4fb6691447c21a6207aa48e651487a3ab5b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
