class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.39/orbit-v0.4.39-aarch64-apple-darwin.tar.gz"
      sha256 "12359a98da50b770b0076c3bda546be05b8d9ddaa38f86866cec1d2c4acf9ad8"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.39/orbit-v0.4.39-x86_64-apple-darwin.tar.gz"
      sha256 "d16afd28cd5565aa81c75e41fa1dcd44c698773f1253201034f4a0ecbbe28aca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.39/orbit-v0.4.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50159923b141342cf3e13da9623e7c9b40ecf1e61e125350449a54e678cbf865"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.39/orbit-v0.4.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c86ae81de393dd2540b477e1502244be77b118922484cfe90190d023d9b0150"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
