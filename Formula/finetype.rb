class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-aarch64-apple-darwin.tar.gz"
      sha256 "3ba29c90c7fe3c9cb8fe6d61c08a491e8385ddfc2f391b55c43e444bb2f546a2"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-x86_64-apple-darwin.tar.gz"
      sha256 "aba4c8732fb2af3a99629428ab64bc4683d1a450766ae5dbc192df1f500b428f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd46ef9892b81244a97389a9ea8546db6c9c27c8f9bb6859da632339c9752d27"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.11/finetype-v0.6.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c276e08a40206e6329856a09fc9b8da33b247c6d83c258ae5263433cacef4126"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
