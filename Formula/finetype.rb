class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.27/finetype-v0.6.27-aarch64-apple-darwin.tar.gz"
      sha256 "396e5eece142ca6eea777e199a2bc3d4376c8006f9a1ea5d9f9e48a9b2198235"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.27/finetype-v0.6.27-x86_64-apple-darwin.tar.gz"
      sha256 "e36be2ddf7007a79d21e7802878dc60ac4ade9630398f0c3e124929a7ed6c2ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.27/finetype-v0.6.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dabb76706f72d07c87c78e439c6b7aa3cc38fbe49559aa7550eb7ca973b111bc"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.27/finetype-v0.6.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0d4c2236af9593d300d591bb62410145c2431d46c83dd263a58cf6033f554e5"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
