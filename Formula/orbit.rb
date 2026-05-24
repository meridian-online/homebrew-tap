class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.32/orbit-v0.4.32-aarch64-apple-darwin.tar.gz"
      sha256 "dc116fc9c5879c963420239463bb43d4b5a9bf259bcbc602968cbf1ea3da84e9"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.32/orbit-v0.4.32-x86_64-apple-darwin.tar.gz"
      sha256 "332a1342d52e8e66179262a3de2f58f50eea98e7c2b7795d07a75ce3da966188"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.32/orbit-v0.4.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a3541d817e7808aed9376a0e5bcca7b67dd89fd17b544912771d2b3faa95663"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.32/orbit-v0.4.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94f6c11fdaa17468e97a5cd436d976f7bcc982cc9a3bb5303dfb4ac3a177c370"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
