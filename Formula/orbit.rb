class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.31/orbit-v0.4.31-aarch64-apple-darwin.tar.gz"
      sha256 "bc6b4ee7e0023d71878f06bb18453e431600694453deb81492e4be39559acbbe"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.31/orbit-v0.4.31-x86_64-apple-darwin.tar.gz"
      sha256 "caec18b92b842bf5c70371cafcef3315640a1715066ac6a7712b2f7e2d5a39e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.31/orbit-v0.4.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ad0467d082dd70bf245328bbfa31b39ed9f93be229b7f5c6cfe62733638d481"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.31/orbit-v0.4.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bced83914d91d3bba5df44d09910dbbd2ffcc0352096bff1bc405231fe0ca0de"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
