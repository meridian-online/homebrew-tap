class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.13/orbit-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "1971903bb4b3f3023ee85e4a2cbe230e8f6c369c4db78997426d438bac95fdb0"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.13/orbit-v0.4.13-x86_64-apple-darwin.tar.gz"
      sha256 "aacbe4973200b3147aeffd00324302bbe41f88e604a979b915d18f986b196e28"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.13/orbit-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6f43a204b62e70c0880f424b7af25d49ad256a8c9670893b1405c6cbfbd79aa5"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.13/orbit-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "34f8dc20693b426958428fdc119f57b70aeeb3af59659d59029bf5293914680d"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
