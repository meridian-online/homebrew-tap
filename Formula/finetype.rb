class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-aarch64-apple-darwin.tar.gz"
      sha256 "e5e17ab587805bc8bc6906a167d45e11aa12a63078341a20475a945ca2c835db"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-x86_64-apple-darwin.tar.gz"
      sha256 "0cfeb81e902cca3694bc28da31b9f07a7f0501c9b2e661010eeb35697521b527"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7892c94a5e3ad564d81fadf6149823aed722bbbeef673dcae576bf54989a14e0"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.15/finetype-v0.6.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b8463094b4525f87c7c19f8e6ae0cae187bef82b4e28d1314674a2a609acc15"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
