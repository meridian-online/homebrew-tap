class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.14/orbit-v0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "28a51aab952eb8e5ec010d39131fb8c7b4a97d93fd613f72c9da477901f2fc9c"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.14/orbit-v0.4.14-x86_64-apple-darwin.tar.gz"
      sha256 "9796842ceb733d3a6d0875a3ef7a03ae36f42c99c9a07bf339d131be6886ad8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.14/orbit-v0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6685b651034ac8fb022d6fd5bb092926df0b00fd2d47d559ee65e6a0cfb8088e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.14/orbit-v0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "800c56f2bfc4bd7599980be6570061c21903ac86565ec7764af1ed49124af6ef"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
