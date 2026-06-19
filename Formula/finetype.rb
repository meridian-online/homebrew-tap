class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.35"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.35/finetype-v0.6.35-aarch64-apple-darwin.tar.gz"
      sha256 "3b8da4c6fca5f0756466b5b2643c7a2889b3fde29fbcd498678658c750c36315"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.35/finetype-v0.6.35-x86_64-apple-darwin.tar.gz"
      sha256 "71f46267a73dd3d18f0a8a6e5dfdd5edd245d837d81249ef7f26971cdbaf9117"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.35/finetype-v0.6.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9128bccaecda5bdf6280b680e8a964d7debb77ab78cebfce91d207be8d5218c1"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.35/finetype-v0.6.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75ed121609999f178fd5bd5cf8c9b56808bab04efb26071b19d95256e75acce9"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
