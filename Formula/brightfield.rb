class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.2/brightfield-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "dcb6e20e083b5b7aaea13dedde776317160ea50dc0e1b8418d496a85091515aa"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.2/brightfield-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "88c5f39c91d648b60090f9a0f2f9b7600a143ccf93b5ec70da9bf84e3355629f"
    end
  end

  def install
    bin.install "brightfield"
  end

  test do
    assert_match "brightfield", shell_output("#{bin}/brightfield --version")
  end
end
