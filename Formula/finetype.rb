class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.5/finetype-v0.6.5-aarch64-apple-darwin.tar.gz"
      sha256 "f8e1c812f4914b155323d2bc3065c42177bd85f0b2059fe318554fe466e335d4"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.5/finetype-v0.6.5-x86_64-apple-darwin.tar.gz"
      sha256 "a05ed40f19b5a0f3bb6682b2283fa1b5de65b5c50207a805f83078f36bcc2d52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.5/finetype-v0.6.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49311b1de4e102850c2ae4d21c8a69d1ecec24bb15a681f1a88b3757d9c192a1"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.5/finetype-v0.6.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9095411b7ccbf67c917e52e68b1cd91409b70c4bae475d0700073dd3e10b1d2b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
