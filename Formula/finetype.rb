class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.2/finetype-v0.6.2-aarch64-apple-darwin.tar.gz"
      sha256 "2c0ef7d2109138c6498f5648e1a484ada63af4d86e019c356e35b7ba33a38719"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.2/finetype-v0.6.2-x86_64-apple-darwin.tar.gz"
      sha256 "5c8726c75faf2c68966d1ddd5b58ee3ae7f64098ad47228b47fef95c074ff8f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.2/finetype-v0.6.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d9e7fde1b7c5f9e04e0c8569c41084bfe598f0a90fc4b4c532ffd2fd694d6dd"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.2/finetype-v0.6.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8d5311fa710e12ccad6df041022f2d5952f3500788a6634db425d2fb483ba6fb"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
