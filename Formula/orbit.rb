class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.9/orbit-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "7fcda345dde2dcf2c59232c3860be79403eec22fc82752ef22b5dece29ec07a4"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.9/orbit-v0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "8dfb316986a50fa03a2c568e43e85a0d299b66da7a11ac0454068d6d05b98397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.9/orbit-v0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "14cb5d0c9b18b9a374511a72a75792820540044fdf7497bbe896c02f1fa22815"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.9/orbit-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7df7591b520136c2d83445475fc17c126c194fb0a59446d5067616f61154e7da"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
