class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.64"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.64/finetype-v0.6.64-aarch64-apple-darwin.tar.gz"
      sha256 "474e31ad1ec5db533845a2de214ba7e8bf5dd13afb4c60757f4e3521eea9ea35"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.64/finetype-v0.6.64-x86_64-apple-darwin.tar.gz"
      sha256 "9451dfddabcd43b3d9a269483add8b0e949c30b6380dd005ed15e13e4bcfa9fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.64/finetype-v0.6.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d2b8a15c086f16221d5508f3eb6ff81cbca7238dd234c26e59ab40917ecc4fc"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.64/finetype-v0.6.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efb2553fed4026a39211724ec06e238be143461bfc0d473c7f86358e12e11436"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
