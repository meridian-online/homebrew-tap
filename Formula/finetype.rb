class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.14/finetype-v0.6.14-aarch64-apple-darwin.tar.gz"
      sha256 "df2d563e0f82a186a889a02348afadbcf52906757b1c43b4024353c58c3b5f8e"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.14/finetype-v0.6.14-x86_64-apple-darwin.tar.gz"
      sha256 "2d1830902ad14c621ce9b6452c0b230cc26032a762bda28df50b3d59088d4af4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.14/finetype-v0.6.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b23fbafdfc0ba121082adb2ac2ada323890b154ca57c1bb04b3824aa38360715"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.14/finetype-v0.6.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "159b125fc360a903956714ed03f89c11f04c89d20d14bcf20fdc7026b2cd5b82"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
