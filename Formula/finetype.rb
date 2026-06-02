class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.22/finetype-v0.6.22-aarch64-apple-darwin.tar.gz"
      sha256 "3463c0a3ddeaf90a6bc03b82268511a1ef10371030b4e2e69d952509d4536eec"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.22/finetype-v0.6.22-x86_64-apple-darwin.tar.gz"
      sha256 "41525122287024c7d2b63de483678ec0135155cda0a481c98032ea3bbba4bdf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.22/finetype-v0.6.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e368e67e70464ad8f6991cf53314d904e14b5e142b5b8c5ea629c8cd68f91ce"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.22/finetype-v0.6.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c007290b1487fcfc0c3e172c75b7bea9f9d39a9cb58b21f12d3839efd8ded8b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
