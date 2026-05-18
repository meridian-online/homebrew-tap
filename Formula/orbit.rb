class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.20/orbit-v0.4.20-aarch64-apple-darwin.tar.gz"
      sha256 "edabb0e1a6fac15c2f8ab24d2d8f5c324edc139059bada4472f89064b898cb0a"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.20/orbit-v0.4.20-x86_64-apple-darwin.tar.gz"
      sha256 "9cdf50b3b283a8f165a3a0bd3c816719b99b1a77fed9a2932ae4c7cda06a8a85"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.20/orbit-v0.4.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88bbc2298c1ccef0f19a9a543d332484b34c3ffb4c73051c7ada7e2203db1941"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.20/orbit-v0.4.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2abfc3631cd380881dda3e27af04c4e22be366cee0a295b84f8db08667764b66"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
