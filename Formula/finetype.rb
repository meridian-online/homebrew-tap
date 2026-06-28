class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.38"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.38/finetype-v0.6.38-aarch64-apple-darwin.tar.gz"
      sha256 "47f7ef99dbf1cc6529367393d4109401e71e438910bbc8815b9aeb4dd5e9b1de"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.38/finetype-v0.6.38-x86_64-apple-darwin.tar.gz"
      sha256 "3ba8e35f426459196d00a53fe02bf805c74d816b06f77a5fb3c0edc58df7c3fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.38/finetype-v0.6.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "508559b422cd34489c30242381951327ae44ac72269bc557ebd9bdc2bc0315c5"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.38/finetype-v0.6.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10c417a2ee940b3541999df561e386e70fb24df1e7ae536283e48fb59741958e"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
