class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.38/orbit-v0.4.38-aarch64-apple-darwin.tar.gz"
      sha256 "eafe9e16c014233f6619adcd327075379b47e48540e3eebeeb2d5543547329c5"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.38/orbit-v0.4.38-x86_64-apple-darwin.tar.gz"
      sha256 "5c653d2e62b288dce43186c370e1b9e69f58b8f5308ee8c0548684de173fb1ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.38/orbit-v0.4.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6b851c5e3a09f5df877c856c21e773cf7c2be28a174284e14a6a5b327cd9ce9"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.38/orbit-v0.4.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7126ab11831455ecbccb9b1a0038b13d54f979b844e3fa0cf23a6f18d54ac3f"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
