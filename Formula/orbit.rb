class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.22/orbit-v0.4.22-aarch64-apple-darwin.tar.gz"
      sha256 "47a4b5a1fae9145d3ae13c5fd964b2fa2cdbe741d5baddfd9729f68bebcdb287"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.22/orbit-v0.4.22-x86_64-apple-darwin.tar.gz"
      sha256 "7af01f78d82ba09a8f3765df0c2118a93c0c89d28bdd5832323c45655fcadeeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.22/orbit-v0.4.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7effedcd2d461ab287c864ce394c892eac9789b93deecdda807e99c6c6b967eb"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.22/orbit-v0.4.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d50b96d4408fd3b904c2c6f4140d057891525bdefadb90623694fe4263d07f0"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
