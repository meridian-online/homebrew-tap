class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.18/finetype-v0.6.18-aarch64-apple-darwin.tar.gz"
      sha256 "806edd8f077fb6d21baa3f598fd90c9d9f4abd08be80b806e70cf5234bb8afcc"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.18/finetype-v0.6.18-x86_64-apple-darwin.tar.gz"
      sha256 "2ef3670453ed5c2e447eb1bb117d204d33af775c872f49bdc4f6af172900ee89"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.18/finetype-v0.6.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6faef35ae051895d28a53fd689d70b569f3e332ec4b24e4e715e11782070e5b9"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.18/finetype-v0.6.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4fcddca76d4752f254d2b1f1494ee3eb602d6716e234a926b384d7e7a29c4b98"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
