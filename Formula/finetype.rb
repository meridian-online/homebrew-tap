class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.62"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.62/finetype-v0.6.62-aarch64-apple-darwin.tar.gz"
      sha256 "d331f759833cb29cbd72b961616ed2e0735bde232618039dc83c4ac57b00a16e"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.62/finetype-v0.6.62-x86_64-apple-darwin.tar.gz"
      sha256 "6e465246e2809dde7b6faca6556b4026eb56a6a3c30bf2eba479d362fcd75306"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.62/finetype-v0.6.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bfc243d8f8ca9b2417edde4385f43dae397e0b91a07f228b54e3c6d3abc7fc8"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.62/finetype-v0.6.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9acb535d29372c337b018d8112cabc1649fcfbeba827a11d86a95aeb5e69507"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
