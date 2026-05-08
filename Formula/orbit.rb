class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.2/orbit-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "1a4612e803df6dcda0a15e9363278d631c964ca1c1ebb95b0396f3e0f465437f"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.2/orbit-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "ca2d2123bff1c12f565f25906987adbea19ba72c611b7686b612588bb4253686"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.2/orbit-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e5b5e2361af0ebf6600102493127cc0ea8bdb5953690cd9cf5f8a534d63d59e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.2/orbit-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a340b602b14093f61cbc88928eacc5e62f3d2a10e0897e944eb6d7e13ee186c9"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
