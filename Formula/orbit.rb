class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.28/orbit-v0.4.28-aarch64-apple-darwin.tar.gz"
      sha256 "1d831e2362b9b6e367b5fddec1c6eb0591ed6a1d1166e93b69d1a1065f6f1147"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.28/orbit-v0.4.28-x86_64-apple-darwin.tar.gz"
      sha256 "e840507f645f272fd4ffb294f14e95e472125001bfe231c75e3eff0ac1d16dce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.28/orbit-v0.4.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0104c0e3c05cc2a8f593c2cfd572ae5d424b828da22964485c624f225e4090b"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.28/orbit-v0.4.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5f56524b2dfe4e7cb13c23a3fcacac388ef0fa362e765324384f99f9b8458f3"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
