class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.42"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.42/finetype-v0.6.42-aarch64-apple-darwin.tar.gz"
      sha256 "19dd49bf8d8395347431bf45668e13c8b743069e1bfb8a296ba6d202d5e3f4e2"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.42/finetype-v0.6.42-x86_64-apple-darwin.tar.gz"
      sha256 "5be59dfd569994a4d023a151eb08ebc970bae46398d21c8d003868a5e4666a18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.42/finetype-v0.6.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81e2627188f3aa6c552e08e398d1e3f621ece7beec5c3f4de5b035ef3b24bbd6"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.42/finetype-v0.6.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "31c522b98f0d859a015a1aa50e7d974686ce372ba70508b80887c1b1f1f2acae"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
