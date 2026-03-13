class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.12/finetype-v0.6.12-aarch64-apple-darwin.tar.gz"
      sha256 "004966181773bd8ae059cb8d1fdb1a41721c2ab20216051fce34d4e0fd94c5c7"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.12/finetype-v0.6.12-x86_64-apple-darwin.tar.gz"
      sha256 "525bd7a9ab66ffb90fcd6d2461ec13d5369799e95fb25904b0d133d00e26ccef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.12/finetype-v0.6.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2ca5bed2fbb1d928866ed6a14307ce3571f621685759c4662e2eecf357d13b52"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.12/finetype-v0.6.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a5305d85950accf56c78a252fa345a7f819eba153bf27bfc836e10243e8bfdb2"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
