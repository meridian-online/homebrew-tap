class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-apple-darwin.tar.gz"
      sha256 "0544f2065d4c869a83274ddf7bd6ffbbd8408cb4436e2be4af18e80a46c43e31"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-apple-darwin.tar.gz"
      sha256 "54eeabdb369eb8277f47af41b753b967b29400c0d30518c021599bb42cabfce0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c503c3b71d2112132786edef6b9f04e1c7d307cd3eb67832fab48d2c13ff6221"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e2f6458b7e08491a23c12ce5463536beed259a7bee23635ee1d8ef502bd07f7"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
