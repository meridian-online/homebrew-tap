class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-apple-darwin.tar.gz"
      sha256 "d6f471bd91b9817a25633918fc6995a5d62995a09c8ef4654880a33060033498"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-apple-darwin.tar.gz"
      sha256 "a57148f71062a30865361259062771ff7b96334ab2aa5b95eac1e075adb765d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb17b0a33787ecb90be1bc9e8657d82121c78715ea1e34245dc5e50e687a7b40"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2cd6c86b4e5b3c91127b6c4f31d4d745ba7e9bd4bdeb579f11d129d6f4aa2b1"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
