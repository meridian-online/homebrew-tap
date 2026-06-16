class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.32"

  # Hard runtime dependency (choice 0100): profile + validate shell out
  # to the duckdb CLI for all CSV/Parquet ingestion.
  depends_on "duckdb"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.32/finetype-v0.6.32-aarch64-apple-darwin.tar.gz"
      sha256 "53c9db46aa735d5b513e917dc28341cd32557b77e1dd4b8f2813be0ea846799c"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.32/finetype-v0.6.32-x86_64-apple-darwin.tar.gz"
      sha256 "b1260ae029965edf74d518759843ee5bfa2f0e98ae40af2d0a240bc4ef3a33fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.32/finetype-v0.6.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f85f5b95387c10f7b55f7977953f4f3618c9d27245158754e021899d721f4bcc"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.32/finetype-v0.6.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "752673647cabd0500179c030881d0790fc99ab634f34ce619e8854f2646e0d6a"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
