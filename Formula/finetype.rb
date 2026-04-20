class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.17/finetype-v0.6.17-aarch64-apple-darwin.tar.gz"
      sha256 "5821c646484db30f2e4f7064db48edcd1edacf894bb8f456c2d780f49d38a0e0"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.17/finetype-v0.6.17-x86_64-apple-darwin.tar.gz"
      sha256 "7dfa6a6f8c36137701474aab5020f34319a15f9aa4e3709698223fa268fce8d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.17/finetype-v0.6.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5702742b61ef63cb062cd9ea48cd9d9c204d467b368efbde3118327c3d8bec8f"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.17/finetype-v0.6.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2408f46b399e8a23b591ed7ab48c64ba5acbcf57079a050593c70b3342ce937"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
