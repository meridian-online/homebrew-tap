class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.20/finetype-v0.6.20-aarch64-apple-darwin.tar.gz"
      sha256 "ea6a01991500b3a51ce1627dd10b77c780c066ec2aac60f662cfc4c0fdd9bb5d"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.20/finetype-v0.6.20-x86_64-apple-darwin.tar.gz"
      sha256 "e59e514b26716e7df88abcb36ac712542d0f36efe56267e24cc044609c5b7e58"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.20/finetype-v0.6.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2bf528b2dff3ef4634352f33503038b8a9920f69d0dfe89a48d455f75ec8fc7"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.20/finetype-v0.6.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcefbc2c9ce6c7e47b5d908fd0e9c488558a34759b847df9c7919c24e7ecbb0b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
