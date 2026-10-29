class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.66"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.66/finetype-v0.6.66-aarch64-apple-darwin.tar.gz"
      sha256 "acdcae842b2cd5c26670d93f3b96023f48ebaaac9fd86566b6be345ccf0334de"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.66/finetype-v0.6.66-x86_64-apple-darwin.tar.gz"
      sha256 "79dcf81f517054b994f93e8b21241689148b4214bb6fb1c7b4c057a2506b12b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.66/finetype-v0.6.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "610139d5dd0ef9093ad9cc5668367d73f45144a6d41de5a6038cbb2dd06ed098"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.66/finetype-v0.6.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd6dec8dcd69615a8c33870e8edc0556881cd477a36ef75e6a60fb50205ad8b4"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
