class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.49"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.49/finetype-v0.6.49-aarch64-apple-darwin.tar.gz"
      sha256 "dea19f66889e2cfb267c909830d1ffa017b18388c06e2e217b9361e319d2ba76"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.49/finetype-v0.6.49-x86_64-apple-darwin.tar.gz"
      sha256 "0b84588011907f51746893bab26737baa8bc7c7a6c0c0351a63397a331e9108a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.49/finetype-v0.6.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9341c5897c3309c52f5d2ac9076934a4186b9423c0a47bf4e1fe1b0692d6a18f"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.49/finetype-v0.6.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5600d389d082d758e3b5ac4fa1977a4611a45f1a306ec0d78fe75550ba575258"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
