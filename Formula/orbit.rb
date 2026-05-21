class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.27/orbit-v0.4.27-aarch64-apple-darwin.tar.gz"
      sha256 "765a56f8decae9d427623dff74624edb033817fa74140f4d0a1138d233193956"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.27/orbit-v0.4.27-x86_64-apple-darwin.tar.gz"
      sha256 "cc36fe6dd95a69fa50f57c0165a6b17ba1f67b122f32edb559af5bd288bcc3c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.27/orbit-v0.4.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce98d52efc4c7792ce9078ebc407c0171eb7769ec6a7325f208d3f281d092c51"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.27/orbit-v0.4.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de274f946ae621a3ee8fa70472d1385268a0a09e12202b2682d30829ef4c7c8d"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
