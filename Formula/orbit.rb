class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.17/orbit-v0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "284c3b5d57b93e18f8d456e09da79e45925c480b4a365faff05077e53b01d737"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.17/orbit-v0.4.17-x86_64-apple-darwin.tar.gz"
      sha256 "14f935c04fbba3b95d45d78d61de3336f581f110c48c73b9661afd32efdd5ceb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.17/orbit-v0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be0dd1de026346b2e5bedcc76d606eaaf46704dc4ba79605fe3941e488ddf2f8"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.17/orbit-v0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2a5e2ff6f98089f0198fc9072b0a24bc92ba989963b199356f58c914ec9e74c"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
