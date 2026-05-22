class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.30/orbit-v0.4.30-aarch64-apple-darwin.tar.gz"
      sha256 "5335bef81801b1cb07b6e9694828d77fbbf40f84ad53ef70f20e58183a09b97e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.30/orbit-v0.4.30-x86_64-apple-darwin.tar.gz"
      sha256 "d58b2bba09f3d6bebe83acb3e6504714554a5ff3d5b04354c9202ce93152ce12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.30/orbit-v0.4.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "898067348b3e7cd42b54a7cae06dc059938a60c7bc65a8d27f36e5ef7500741a"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.30/orbit-v0.4.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c13ecbb772dbda3c0f6bff4101286ef3227f486c785be982620a68727a2d130d"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
