class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.19/orbit-v0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "3611b14934cc23ba3f31ee893f9304855bd2cb96c5dbe3c4758ae671c1b8575b"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.19/orbit-v0.4.19-x86_64-apple-darwin.tar.gz"
      sha256 "e35213fbb7d31936291a462adef303bcc2a24ef786e0c54bfa518906baed6c6b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.19/orbit-v0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "27e5c69c276f1a82ea6dd4f3a539b09817ea3e8298a2eb41ae7f65dcb04978a2"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.19/orbit-v0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3dfec0d2aefb7c0a55d9ae6bd7d235c12fd274c29a4db459f01cbe2de79c0229"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
