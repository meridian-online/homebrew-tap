class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.19/finetype-v0.6.19-aarch64-apple-darwin.tar.gz"
      sha256 "193e95d537684e8b44ef1b30271f8ff7d0f43d105a78dc9c4f530b6535cbc5bd"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.19/finetype-v0.6.19-x86_64-apple-darwin.tar.gz"
      sha256 "0a407bbf6c9483dbe1672b7a2c5b42ddf3973281ed527655dcaafa197a446480"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.19/finetype-v0.6.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41e9192a0f95615a139105a346912deced8b4347f864910e97d43d53e4857cc3"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.19/finetype-v0.6.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eb49df27d37a5311c9c5111e8b83f116ee85f2216fd98cd408b4dfee3afb88ec"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
