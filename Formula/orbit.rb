class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.25/orbit-v0.4.25-aarch64-apple-darwin.tar.gz"
      sha256 "3168931b635ddf6ecebc7218a2676dadac5ff89582072455c8b5fd2722cd1a72"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.25/orbit-v0.4.25-x86_64-apple-darwin.tar.gz"
      sha256 "d38cce56e2798d7faa657ac579f8b4fc87c67572188b339ab4c179860598da94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.25/orbit-v0.4.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "feaab01f1affd755bea6da553855fb08564a2bc6f856b031733268a566cb1c06"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.25/orbit-v0.4.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bbafccdf26bb5fcc249ec18603a20556e711928ebd488b4e98e1bd6a9b22739"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
