class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.29/finetype-v0.6.29-aarch64-apple-darwin.tar.gz"
      sha256 "d5784f9a888fe880c4ebefc851c6311793be1f6277be44e7d98fa97cd4b3ea37"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.29/finetype-v0.6.29-x86_64-apple-darwin.tar.gz"
      sha256 "dd2d628763a9518f559f4b56b5a389b43a07387b8d0126475a584fc6453a982d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.29/finetype-v0.6.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a040d7febdaf47e86d3984a0eab433682fcd84b4ea8d2f808a3e61bce5d64cde"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.29/finetype-v0.6.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fffb8223df453b1a16a3212817ab53240fc7c80c6acd3056a59c539fdd105a57"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
