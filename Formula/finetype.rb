class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.68"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.68/finetype-v0.6.68-aarch64-apple-darwin.tar.gz"
      sha256 "d245f8fb871995cc04daef240ca8a9cb5ca111743207914d9dc9f164370fe69b"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.68/finetype-v0.6.68-x86_64-apple-darwin.tar.gz"
      sha256 "b26b7bf93d09169661e4ed0e7e2820ed0afa0faa8eb062b61d505096751e27c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.68/finetype-v0.6.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ef897da7e7c19d482ca947c86d1956ee408e73798807f2016c1c2f5e33abc1f3"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.68/finetype-v0.6.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7ed2f9229d573f9e7031e41277199c331ced23d7936532a16edb15acc7a432b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
