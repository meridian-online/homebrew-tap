class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.33/orbit-v0.4.33-aarch64-apple-darwin.tar.gz"
      sha256 "90413d11f1c6b0c754df19d5474738204f7c5b4d03266125523ae45861134702"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.33/orbit-v0.4.33-x86_64-apple-darwin.tar.gz"
      sha256 "507fc021c97760e146710c325d51e6b66ecddb62b2e08512836af3b198e80c98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.33/orbit-v0.4.33-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79e1e858594eec361f5a191a3408fb03fefc6e99a52c5e7189efdb87a8e07e1e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.33/orbit-v0.4.33-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6c93d7e426a699ef29cdc5a03211b2dacefab53de46ed7b32c3fd62d31d73d36"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
