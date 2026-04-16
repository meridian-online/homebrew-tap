class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-apple-darwin.tar.gz"
      sha256 "e069735c83c6a23c31a0fefd126b596dce5218e6ca64c99aaa17d1262bfa4b29"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-apple-darwin.tar.gz"
      sha256 "9baf3671380cf1216ee34a6154199cf05beea2af4c15b792d0390d3b9484240d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e4cb168cbd4d957bf21889ed0636be55cb3d88790cc61715ff6940bdb43e662"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.16/finetype-v0.6.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fc53586224e8ed95544723291def2d97b36228043439d5482432e87228482e7"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
