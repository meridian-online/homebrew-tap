class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.15/orbit-v0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "580eab8b3df14c2b871e8bedc59a6671c967f3994bfb06f8270d47f941909182"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.15/orbit-v0.4.15-x86_64-apple-darwin.tar.gz"
      sha256 "e82662f8dff0c3b9de8558f57e4a29649e9537372d607a1158062d8e700495e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.15/orbit-v0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4e46254818abc4deec6b96ea20450d65c720cde1479154fcfb572308b44ebe2d"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.15/orbit-v0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a34ef9056ed1bb41e383469ce2173635a0a7850966fdf4e73a207da1f780010"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
