class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.6/finetype-v0.6.6-aarch64-apple-darwin.tar.gz"
      sha256 "9ab3625f7a66a35cac6b8900aa2fde16af9a53661ffdfa8f9d4fd73d30c8a80d"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.6/finetype-v0.6.6-x86_64-apple-darwin.tar.gz"
      sha256 "58ebaea2748f4704bc9adb2bc7de81fd0cba0fb5e5b69131c424874a3c8ec00c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.6/finetype-v0.6.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25feb2ab8838cb9dc790601effc5454b6813809bb976b9d2941c2de03b335a50"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.6/finetype-v0.6.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dac46daa3af7887ee8b5ceb9bf4212d84abdd35c8cd8781156482bab42840121"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
