class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.3/orbit-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "4e2ae13f1e2141b3d17ff0555f2dddbd171f55e3aadd889217a3a0c60053d76d"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.3/orbit-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "63eb22884b66da0731463877228bcc361f5ec704982b3f7f5895c6115a0dafd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.3/orbit-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b36db5271b367980b8c136d528ae9787a8c144c2f56af8f3b527f83551de57c9"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.3/orbit-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b79ed9b274c154293929c6aaaf6be712a3ec41748573d877233363d8e8c2d94c"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
