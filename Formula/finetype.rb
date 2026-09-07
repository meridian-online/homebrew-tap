class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.59"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.59/finetype-v0.6.59-aarch64-apple-darwin.tar.gz"
      sha256 "bad14fe49c35c9a528c601837e826428c3b3fddc004397e127b0e07c1ebd3ee5"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.59/finetype-v0.6.59-x86_64-apple-darwin.tar.gz"
      sha256 "954dbcacf2b1a3c2bb884da548403cf46b91f36814eb20df8b89d2732f5fac9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.59/finetype-v0.6.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2c30be46e7eb38a3b425999a3eb770531e9fc9e64c6fe32dd8c62cde7710fdb"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.59/finetype-v0.6.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2bdd0b740494b7459c72a9d2e01b7e702d82916536497891cea88a848d5bb058"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
