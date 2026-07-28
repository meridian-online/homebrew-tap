class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.54"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.54/finetype-v0.6.54-aarch64-apple-darwin.tar.gz"
      sha256 "5b9d8239d772c4794a16fbd4426247f49a8b98bcb72727753cdec50161405281"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.54/finetype-v0.6.54-x86_64-apple-darwin.tar.gz"
      sha256 "92f464a50246fe3e64765371f4a70818b0fa9e4d32d15c2eec44186612592472"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.54/finetype-v0.6.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d51570e3e68f1e67fff89a1919c84a408ba536c1021cd4866f35496135d1d845"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.54/finetype-v0.6.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7576a2733e600d16017734f34535f29d1d9355e4bd1b49f3cbdfffe83070d40"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
