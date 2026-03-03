class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.5.1/finetype-v0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "482a05e0ddf730047aa42dfea60fd0d6af33eb23d596f2b6d2f74c299767e9c6"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.5.1/finetype-v0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "ed9b5b9d242563e0b687fc11b595195c863f9ab1f96f02411331036e8cc49876"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.5.1/finetype-v0.5.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0932a04bf2c805cb19fef0917e2afeee436f42bc7daa585b3228c5f22c2b9f35"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.5.1/finetype-v0.5.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9730552c708b53f7631fbe052de7efd846d1f61e7c2026110585347441a1588f"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
