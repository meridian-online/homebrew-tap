class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.24/orbit-v0.4.24-aarch64-apple-darwin.tar.gz"
      sha256 "ec6f9ac226bd9a2c99b3b1f9c805d9dabe480c19b2ba9112ab6cc5e9cfb45b9a"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.24/orbit-v0.4.24-x86_64-apple-darwin.tar.gz"
      sha256 "37534b6596bbce58d152fc5386a40242a05fafdf5044851a9e0ca44f831c3f32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.24/orbit-v0.4.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6af34a99c23f24cef4de4ff705500da8b3c0dfa486f48cfc046228f52ca1f928"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.24/orbit-v0.4.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa76c061502859cc9d8fbe660b01122e918c0397cee5416c7e7d23808f78ad7a"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
