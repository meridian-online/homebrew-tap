class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.43"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.43/finetype-v0.6.43-aarch64-apple-darwin.tar.gz"
      sha256 "40804d262cd9602b232ff2915c570b49b8a8e41a1c218c61cc666e3451daf19c"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.43/finetype-v0.6.43-x86_64-apple-darwin.tar.gz"
      sha256 "a9b93a99e42f4cc27b5d56e9b6e0b6ab1a0a8dce2e7b5c08f818a2d66132c54f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.43/finetype-v0.6.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "06350e1eb156bc07fe3206fc7576603c8fec4d9953756eada1b4ed7552e6157d"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.43/finetype-v0.6.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2355314b3589d80515fb3aa79884215614af5fc90a3e7c0e7c1be69ad14e2c9"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
