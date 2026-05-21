class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.29/orbit-v0.4.29-aarch64-apple-darwin.tar.gz"
      sha256 "70213df84893fdbda4531683309e8db5727679f5897b4e263067b275db83165e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.29/orbit-v0.4.29-x86_64-apple-darwin.tar.gz"
      sha256 "669a6982b6ac8f8055aee7e8a934adae4fe634bd77cfab917d7ff78ee102bfab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.29/orbit-v0.4.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13a7b8aab5d6ee03d4ea6055566fbed9693d5245ecc6330bb701af5d2b5541be"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.29/orbit-v0.4.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df271d09e05bf0385d3c002cd5d13025aa4c0a52cc0ec3959a7e1313dd0fe1bc"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
