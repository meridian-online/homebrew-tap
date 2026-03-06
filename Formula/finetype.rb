class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.3/finetype-v0.6.3-aarch64-apple-darwin.tar.gz"
      sha256 "85459a82060224520ebe094ad23771c79253bcb5b14adfd31ae1108df368d011"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.3/finetype-v0.6.3-x86_64-apple-darwin.tar.gz"
      sha256 "7be76d6ef317af848d750d96cb29fba6f016877084347f0fb3c54fb319e3a8da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.3/finetype-v0.6.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10139056ad222018c874f3fea1dc6a26f7a12ade8bb3985c7dbdab83b53874ba"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.3/finetype-v0.6.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1254eed790cf4b1fda27cdd75a989035216bf4f1e127b6e89cdcbbe6578ea55e"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
