class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.58"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.58/finetype-v0.6.58-aarch64-apple-darwin.tar.gz"
      sha256 "70e17bc959846da3923db12c4c4e8f6aa45e2b63583315acf60df65c682a7ff0"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.58/finetype-v0.6.58-x86_64-apple-darwin.tar.gz"
      sha256 "6d849687ab9a82e917f050977bc253a9a0d63db4f9b250ce558c5b18706b0566"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.58/finetype-v0.6.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff9cb0aeb5be11e12a412d17cd287a5034fefae6638fe04cd8ccee46d45c68a1"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.58/finetype-v0.6.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1f84a4bf90e55094e5afe1e97808e7b67a8da542f6399cfbb538b65a132b78f"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
