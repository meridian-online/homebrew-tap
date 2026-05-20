class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.26/orbit-v0.4.26-aarch64-apple-darwin.tar.gz"
      sha256 "2d31f907c022c32701a4505419251d08dc7ae8af67e1078099e83f28e55c5c76"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.26/orbit-v0.4.26-x86_64-apple-darwin.tar.gz"
      sha256 "d3aa3b283fbfe4db6c6a2a4c5b1cbfab1cb647e11b640b87f14cfc1cbe642672"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.26/orbit-v0.4.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73405999fafe41f3522f9a3566d368693a44b705191fa4f08cc445eac152f9bb"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.26/orbit-v0.4.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "762338b1952c33b25e336a234f400fe128f81149400ea13525dff8ae16b174bd"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
