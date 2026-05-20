class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.23/orbit-v0.4.23-aarch64-apple-darwin.tar.gz"
      sha256 "15e144590b845b44a2b363bd0b8305b52fa9e560f957f385b641069111ac5063"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.23/orbit-v0.4.23-x86_64-apple-darwin.tar.gz"
      sha256 "cd1cf1cd79cc2728719a763c25960586f9663ce4185ca19910aea4f10f0a2a63"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.23/orbit-v0.4.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c349969315c3b1172b77e6039dcbb3fd96bbe66acaec33f32abff73c8817f3c4"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.23/orbit-v0.4.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbd1691f6e75e8905ba58a499b4963f0f901ffa3eaedc6a273f995462fc7e075"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
