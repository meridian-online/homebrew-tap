class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.55"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.55/finetype-v0.6.55-aarch64-apple-darwin.tar.gz"
      sha256 "a58420b62762e0f1ba49c86e5282f256cd61cc31069227d8d9608a26b18a5451"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.55/finetype-v0.6.55-x86_64-apple-darwin.tar.gz"
      sha256 "ba43a4aefc76c87b629c1501ce0fd354d220359418d4123a69fbbd381205daed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.55/finetype-v0.6.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99c74d3deeca616395700f4b16cee33d221c5720cdf3690be9841288baef54aa"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.55/finetype-v0.6.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "39c69469db8f0bdbeac37b6097e2bf7dd6adaae073960001ec9a3dc766b7de19"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
