class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.34"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.34/finetype-v0.6.34-aarch64-apple-darwin.tar.gz"
      sha256 "90e9d0c110e0d790213ed7d9bf1871f3906eeb7399abe951038178c679d7bcb2"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.34/finetype-v0.6.34-x86_64-apple-darwin.tar.gz"
      sha256 "504e1cdd5daadc368bd177bd802fa39c08df8fd6507618c5501094c3412ce8c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.34/finetype-v0.6.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "754b3c8e608541048ab10978879e0d2aaacc4e30d61b420f48b5a6a357819564"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.34/finetype-v0.6.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cdcd56b6dac5c20eed7694e23321c7fe15804a9f6dad63c2bac3a0498c54a2ef"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
