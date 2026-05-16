class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.16/orbit-v0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "3ddfe949bd06bb8c1b485fcabd06e9dae30c64522b6c78abbf7dbc3777fab66d"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.16/orbit-v0.4.16-x86_64-apple-darwin.tar.gz"
      sha256 "522fbc1686b4fc09a54f8d4cb06501d0a6235da0513ee3e092bc4affc82660a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.16/orbit-v0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f47333ae9b58e7b440b2205003b40de4a9f2244fd66fd5bf142be9148931e2e"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.16/orbit-v0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f595af38ccdc1f021af8f9ce79e82b5a5bddae529065da2ffe780f65c714549b"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
