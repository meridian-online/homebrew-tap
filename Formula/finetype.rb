class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.41"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.41/finetype-v0.6.41-aarch64-apple-darwin.tar.gz"
      sha256 "8052436649e7f09caf39ef18698e93e41b9a852c164e5f36af4eae52fa626f37"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.41/finetype-v0.6.41-x86_64-apple-darwin.tar.gz"
      sha256 "6067fcbe744e20370447b11787cdeafe41ce824f75b72ebd9437d4fa7979852d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.41/finetype-v0.6.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bc8b98051afb27910550b4e580192fd4d8d31d12a70007f0f07232419ccb2e8"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.41/finetype-v0.6.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f72948981e5800f0dc1d2bf4c8ac92218a2f72e9c59a96a8e06a93a69411636d"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
