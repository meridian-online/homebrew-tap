class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.67"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.67/finetype-v0.6.67-aarch64-apple-darwin.tar.gz"
      sha256 "e83830a788ecce5f325834351a04cfe8c924e29a48ea4997954ede0b91acdc49"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.67/finetype-v0.6.67-x86_64-apple-darwin.tar.gz"
      sha256 "029181cf42f28c3ad0a727ceb196046ad56b0d7cda2c4a4892f206ad57794755"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.67/finetype-v0.6.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a28129f5f5a4431ad59a54131c38eb63455bd65cd00a1810fe8cdab153784083"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.67/finetype-v0.6.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8c16ce04eb6fca1d28462a6de6a74c9f9fadd119c21226e99b59dc8db317132b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
