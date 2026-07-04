class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.39"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.39/finetype-v0.6.39-aarch64-apple-darwin.tar.gz"
      sha256 "3e9f4fd97ebf5d9a9f2d8eef2504ba7971968b58dcb7162a7df1c06aed0d8a86"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.39/finetype-v0.6.39-x86_64-apple-darwin.tar.gz"
      sha256 "97ca9d3d1e293e7b53c9038c0176103653422966f679574e00f925e83b4c9a0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.39/finetype-v0.6.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d51e885f7114bf0feca334cdbcefd769bf0378ad3dffdacd67d88f92a1d25a6d"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.39/finetype-v0.6.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "218455ca5fa4ccaa5e7c504ea222cb4fce353b63f9cad00e65fcb2b7987524fa"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
