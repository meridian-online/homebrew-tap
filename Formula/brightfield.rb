class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.3/brightfield-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "3c6a77261677264391c6afb58b2e489089ee31d94d7d49f6bfb39f1b931f632e"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.3/brightfield-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "0d4708346abff567537d6b687d6a21d3a1fffa8a034d189a10c0a0993ff1f249"
    end
  end

  def install
    bin.install "brightfield"
  end

  test do
    assert_match "brightfield", shell_output("#{bin}/brightfield --version")
  end
end
