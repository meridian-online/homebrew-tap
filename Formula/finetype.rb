class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.61"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.61/finetype-v0.6.61-aarch64-apple-darwin.tar.gz"
      sha256 "e6bc37cbc3312671dda2f719378988e27106d7ea6da2cc49dab55f94ddcda231"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.61/finetype-v0.6.61-x86_64-apple-darwin.tar.gz"
      sha256 "2cfaf339591839ac5a10bd278ac27df525c2371e7981d9ef6c4f9f1255e5d7eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.61/finetype-v0.6.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca38e95febf3f30610e032b8e473b963ebadad3e9c58fed7aa62b3858e2ca744"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.61/finetype-v0.6.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59d3313eb9cfa139a626ab03cad0fb8430c4e62dd884e092dbce8bc8e72d7098"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
