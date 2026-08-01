class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.1/brightfield-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "52ca6d0df49bfd3d11ea15e5ab074a9629953a3f07bbea0cdd567bf7b9750061"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.1/brightfield-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "c765ea96e43f643320a191da57fead4248995e6dc9ef1c57f8b6b012ec73ff1b"
    end
  end

  def install
    bin.install "brightfield"
  end

  test do
    # brightfield is a GUI app: no confirmed non-window --version/--help that
    # exits cleanly, and Homebrew CI has no graphics context. Use a presence
    # stand-in until a non-window CLI surface exists to exercise here.
    assert_path_exists bin/"brightfield"
    assert_predicate bin/"brightfield", :executable?
  end
end
