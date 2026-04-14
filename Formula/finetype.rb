class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-aarch64-apple-darwin.tar.gz"
      sha256 "99d34457dea95b88e4e83b8f81c7d74f4d09286b46629cd9db90180747f7b1c1"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-x86_64-apple-darwin.tar.gz"
      sha256 "d9147ec45e35e50323bb354e3ada5f964d12f10bf11c8c8115d31b33b2261b1d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "479b82bac141755d39ed17ae49a7fdcf95ae967f7260e74010145bb20ccc4fcf"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "899fddfe312778d2b11962213a6842ef10656fbda842452d1b182a305e9d55e2"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
