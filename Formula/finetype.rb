class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.56"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.56/finetype-v0.6.56-aarch64-apple-darwin.tar.gz"
      sha256 "34a73f04a58b6d12f757f7e084dbf4999c39f886559a754bd12fb6817a71d40b"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.56/finetype-v0.6.56-x86_64-apple-darwin.tar.gz"
      sha256 "295739d23eecab4e762969386e5422fe892defd93b07f9023a37d8656127d147"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.56/finetype-v0.6.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "353d9e9be5af7e7321bfa32b598a0b1c08a1540f18190a9e3a9d3e72a51e9c8e"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.56/finetype-v0.6.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80d9a45dc4f4190fb7b453dffe14294421ee3e722072f83db8453a165bd82c2d"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
