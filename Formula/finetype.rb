class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.63"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.63/finetype-v0.6.63-aarch64-apple-darwin.tar.gz"
      sha256 "6d57710efb54676c74e7befbebf77abe97d11aa3f33d81baa7f64711193f2413"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.63/finetype-v0.6.63-x86_64-apple-darwin.tar.gz"
      sha256 "f5e4df9c3f4c0760fd2c5f258b8d1390864eb78f60936ac9a1d05c7175c11c48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.63/finetype-v0.6.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d29c2dd96d2dd1e730f7468af072738e01143fa19da0e4c576acc3cbd19827bb"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.63/finetype-v0.6.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b0cdc2ecfc6c3c61ccbc60b1566c43152bc1765aa1af8de3a6379db07bdfbbe"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
