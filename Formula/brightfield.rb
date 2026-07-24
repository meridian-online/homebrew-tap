class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  version "0.1.0"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.0/brightfield-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "26f18b978be2eee4cd966433f8027d5f194bd1e03df1d8d74242e79b5026ceb5"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.0/brightfield-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f2c6de38b8c72db82ab58896e477e02ae27c9259c1227e2494ed4a8410aa0bec"
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
