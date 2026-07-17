class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.52"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.52/finetype-v0.6.52-aarch64-apple-darwin.tar.gz"
      sha256 "83502762215ecb9b47ab2f014672c3f1c7f7fe03b5fabb015bbeab78cd6deb6a"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.52/finetype-v0.6.52-x86_64-apple-darwin.tar.gz"
      sha256 "3d568ce778844a5e4db19f37a24d28d0aefe4617b087fef806a6a7ebcc50bbe4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.52/finetype-v0.6.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8aed84e4c4e51f4d8e4262e0ff228285c7ca2c8ead8929418b2cfc592af63570"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.52/finetype-v0.6.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b64440a406ca34cdfa537b4e462b0c88734c6e09b767420191f9909de29217a"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
