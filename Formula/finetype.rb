class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.37"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.37/finetype-v0.6.37-aarch64-apple-darwin.tar.gz"
      sha256 "59fad8f4cfdeb442fa5a3b93a787624e3ab7a07b2d10826a03f5be2b4195e2e9"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.37/finetype-v0.6.37-x86_64-apple-darwin.tar.gz"
      sha256 "23fe7ef27a72e7dda4bd687f5fa723d4deb53188558259eb3ca69ac7e4a60b1f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.37/finetype-v0.6.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1af670c91df6cf7046f47613006d82137a02b4bbbb255eb176074c05a88a2c9d"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.37/finetype-v0.6.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "23ea78e89c47431ee47ed27f7efb4fc1fb6c00a2e720a7e3da09cc125709036e"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
