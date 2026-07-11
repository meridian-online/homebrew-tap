class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.47"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.47/finetype-v0.6.47-aarch64-apple-darwin.tar.gz"
      sha256 "58653a66e62818fb9a8d3821ae61f63db87869245df35cb906c13da319c41a4a"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.47/finetype-v0.6.47-x86_64-apple-darwin.tar.gz"
      sha256 "5b8237a4059716166380e202f71c1957521fa95c4690fa4503fe0b6f22cd1432"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.47/finetype-v0.6.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da2d52ff62ed4ab5ee29c0b55ce085121d01b34a76a7be3fdf5f32fffb7d1ba5"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.47/finetype-v0.6.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ede579522df7d5a42720877fc5f7509998424f3a6b7bc3a972edf2d813bae19"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
