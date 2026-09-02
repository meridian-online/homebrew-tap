class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.4/brightfield-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "38bfb871329a36cda35016277f5726b4a6fd4b301163fdbb83d2b3f5cbb0cd49"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.4/brightfield-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "a46ca60e50cee07400896025d8f826ca86f0ec911412099502700d5d885909f9"
    end
  end

  def install
    bin.install "brightfield"
  end

  test do
    assert_match "brightfield", shell_output("#{bin}/brightfield --version")
  end
end
