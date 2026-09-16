class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.60"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.60/finetype-v0.6.60-aarch64-apple-darwin.tar.gz"
      sha256 "a74b84e1911137ac5a8baf7540852e8a99a5227137d28eafc3bd29dbc2b28bcd"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.60/finetype-v0.6.60-x86_64-apple-darwin.tar.gz"
      sha256 "1ef27c6fa78ff7462ce19c9320e98c713dad186438d78698b70cd83c6a67a60d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.60/finetype-v0.6.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77eaeef00a0a8d6b2af566490fc74da10feae2b279eac96c736c61f2773b0f3d"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.60/finetype-v0.6.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c690df124d43cbc53305c81e2cb80bf7bae9ec19867e73b496ff50e88c7530c0"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
