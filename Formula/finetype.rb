class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-apple-darwin.tar.gz"
      sha256 "615f47962b0135cd30fb3ace9a3d6ff5c1d063c587e1d58143f27cc0289a491f"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-apple-darwin.tar.gz"
      sha256 "0ec2894c8e651e6dc64053e188e467be7b38fe7520a4df1eba7a7ab78f6dc402"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "042537004e2a786c100a58664700352f742b1ac56108fbd9b882223ef580aba8"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7adae298c2f24d1335ebbfb0e75a8f51095a0ad9cc14755fa7075f00cb96489"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
