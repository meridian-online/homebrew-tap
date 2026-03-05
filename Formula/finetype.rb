class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.0/finetype-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "46f5c542258a7da40c6a73dbc3dfea6908787c5457914c1b4b9506cc0ea814c2"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.0/finetype-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "43b67b0158759a3f4e116fd493b194856b5605f03de8f53b9237765cbf0c01ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.0/finetype-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6a2cda8b18b7f424845c8d850b320cf5ecb892412e7390c3d8803e1f2b7917ea"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.0/finetype-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "329a4e44e3806daf7c8e2c43f28143db150e7ac9d83f9e3df5c93ba4f44f5723"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
