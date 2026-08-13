class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.57"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.57/finetype-v0.6.57-aarch64-apple-darwin.tar.gz"
      sha256 "5a981c3a103a3d08e6b354f047d5c1b28289c206ec550114ce8d368f7ab52cca"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.57/finetype-v0.6.57-x86_64-apple-darwin.tar.gz"
      sha256 "42c4a85acdab97ad7e881a889406c93ca6ac1f6b67631b9c3920c02d0b06ee12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.57/finetype-v0.6.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c6596bb9207ac2d9b26995bf60f9311f29789e938624cc1008d933d1d17ae80"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.57/finetype-v0.6.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "823855fae84c402d85bc7f9e0aca7eba21ad7d30a7c8261bca6d2516a175b567"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
