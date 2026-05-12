class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.11/orbit-v0.4.11-aarch64-apple-darwin.tar.gz"
      sha256 "b381bb3aa68cba77487a5b2db07a05ec7abb6ef8b6b13c60fe83ac6acc588116"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.11/orbit-v0.4.11-x86_64-apple-darwin.tar.gz"
      sha256 "9e26f93e2a69212c5f377805fc5654d82f549ac985f9c50b1117c9998ed14422"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.11/orbit-v0.4.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7b39932dd406a17b2fccc4a5a6628a68be89d168ae393831fe0eb3ed0ec8665c"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.11/orbit-v0.4.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9b93a8d67ca36f6cfbe1155eabdb75946946a1d7979b196a7df2faa6a6bb823c"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
