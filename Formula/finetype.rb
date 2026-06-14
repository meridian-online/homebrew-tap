class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.30/finetype-v0.6.30-aarch64-apple-darwin.tar.gz"
      sha256 "9178cb1cf930f3c8f1b0fbc85a7608c9fd699a95ab1d4f718147be5c33ce772a"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.30/finetype-v0.6.30-x86_64-apple-darwin.tar.gz"
      sha256 "e5fffe78d5570cff1fb4c9c0da90c5a7e7af05cd6815064b30f10b06e3a447e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.30/finetype-v0.6.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e2886a0537f732057dad820e22b362598329ad599917eb83a93d702db7c2037f"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.30/finetype-v0.6.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "445f2c81170b8bf4790ea9f347485eda7033aba48d9f498ebc6b82b4f3f7247b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
