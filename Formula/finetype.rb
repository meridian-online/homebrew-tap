class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.23/finetype-v0.6.23-aarch64-apple-darwin.tar.gz"
      sha256 "5660dd0f73502a1b2b0184accdf265e1ebcb23737cb65e3bd4c7bfab1c3de0ee"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.23/finetype-v0.6.23-x86_64-apple-darwin.tar.gz"
      sha256 "76cb9399ced0381950583842acc2802b5cd20d022524b76728103f5cab1a49cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.23/finetype-v0.6.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "194ab67301c32d1b0ec9cb07a85a340e65ea565f2354bf76e00613d597a8d5eb"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.23/finetype-v0.6.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7dd6c0cf348a6f381db025bbd92a35f582f7d4532dcffd6ff50ef11d4cb410b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
