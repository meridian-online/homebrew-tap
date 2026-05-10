class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.10/orbit-v0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "b24b52b05f5108939702c02e7f26e25f9bff6442badb886f40a9016827260d92"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.10/orbit-v0.4.10-x86_64-apple-darwin.tar.gz"
      sha256 "2405a780608fbf09b1a775f1fc580e927ed8d27da2df32fbb7570353dcb59261"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.10/orbit-v0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28108b3765a476253a919c6ce6bcaa4871e29a63a1677fcd7889d6803834e779"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.10/orbit-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7f8deadeae4b95f5b46859b8ace96fe9bf8221b6598cda7b0ad09c470fcadc5"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
