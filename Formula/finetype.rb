class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.48"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.48/finetype-v0.6.48-aarch64-apple-darwin.tar.gz"
      sha256 "65b062ab9a9e604806971ba2ec36c101265b4792dad23b8d950c5770c8ab71e6"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.48/finetype-v0.6.48-x86_64-apple-darwin.tar.gz"
      sha256 "49ba2c85b3c01ca03057d2999ba753e159e3c390d594f815f58ba90f5d31affe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.48/finetype-v0.6.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "acc9f9d66b4035b4753063a7182befe14bfd6c9e72caf7295ee640d9f94de357"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.48/finetype-v0.6.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e1e2b206f0177cb6300b4f964dc58022c67df34af8b185d98efed77c8596b69"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
