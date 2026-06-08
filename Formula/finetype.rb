class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.24/finetype-v0.6.24-aarch64-apple-darwin.tar.gz"
      sha256 "1426654966aa283218811dd326f85af698cd582dad228d3a750ede101796acdb"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.24/finetype-v0.6.24-x86_64-apple-darwin.tar.gz"
      sha256 "9724dc0c5295cf5e969e15e9e1cae4275026b9c0bc6f471caf4dd01ef74c91b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.24/finetype-v0.6.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e4c18ddebf97c2bcd38cb8e6a761df5dae514749f41f9c877786799b61b93a4"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.24/finetype-v0.6.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45fb942dbff78d93e1106a65725c56faa5efea5897c10dc27f930ee6848dd733"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
