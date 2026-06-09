class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.26/finetype-v0.6.26-aarch64-apple-darwin.tar.gz"
      sha256 "e5ece5b505ef14966da0dc616cea09f37364437d5eb92f132a8dd2fccfd5b141"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.26/finetype-v0.6.26-x86_64-apple-darwin.tar.gz"
      sha256 "7711c6cf8ad30352aeb0dad5e09fb8acc6ae981d9bbbbce5cb8b9e3ce25bba7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.26/finetype-v0.6.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c270247ab1ea13ee37276084ac92ff9e16440bc257d9149f8b0bcfea17d1d38"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.26/finetype-v0.6.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd8c19fc68b15583821dba6b66a6f15913b9dd479cdb590e770d9a638be0f03f"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
