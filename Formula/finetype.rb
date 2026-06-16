class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://meridian.online/projects/finetype/"
  license "MIT"
  version "0.6.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.31/finetype-v0.6.31-aarch64-apple-darwin.tar.gz"
      sha256 "11f90c329e135ffbe7f22a25ea2146b8b9a9af14aa2dd7579424b91d7aa30ad9"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.31/finetype-v0.6.31-x86_64-apple-darwin.tar.gz"
      sha256 "6d3665544ac70a04a074dfd9b3af219b59a0911591859942cb89f2071bbce452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.31/finetype-v0.6.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83865d4aa392952c4d58291cb679888e98c66d91fba89ba3a319ef20bc5a29df"
    else
      url "https://github.com/meridian-online/finetype/releases/download/v0.6.31/finetype-v0.6.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73f18f89c8e91710e38bf915b2b2961f3da337c01aa2235702079d3baa196310"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
