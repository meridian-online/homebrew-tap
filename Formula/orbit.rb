class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.12/orbit-v0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "35b2b33e109477cfcecc34fdc2af106c93df4357ae355e93a5b21bfc14f66f6d"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.12/orbit-v0.4.12-x86_64-apple-darwin.tar.gz"
      sha256 "fc0bbd178c6afca0ff2d20c4cdf44ca0dca4beda93e3163ab5d597b4b7e07a8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.12/orbit-v0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d9b8fd5e8fa5e9803da86987d9fc7b9b66cd5a308a5d0a2f657b20ddae3862f"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.12/orbit-v0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6867537e03bd9b62e383dbde35658b88ff32d96614bd3d9c80df9709ec8f58a1"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
