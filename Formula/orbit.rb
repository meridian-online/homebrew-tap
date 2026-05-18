class Orbit < Formula
  desc "Files-canonical agent substrate for Claude Code orbit workflow"
  homepage "https://meridian.online/projects/orbit/"
  license "MIT"
  version "0.4.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.18/orbit-v0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "973939ee27c4571a50286895ddd084b5ee39d67a8526964bc4a90954b4d8b23b"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.18/orbit-v0.4.18-x86_64-apple-darwin.tar.gz"
      sha256 "b2c5329f45b0df8f0e354182c4c8107f9ed1c91d0e2c9db3744841e0a45ba5dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.18/orbit-v0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "292fb0497f4cbba4164990f490bbef9de7b3c1bdff8789476a8bc58d5f5f795b"
    else
      url "https://github.com/meridian-online/orbit/releases/download/v0.4.18/orbit-v0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a428b5237eae49c831b002320cc29fda21733c9ee7ccb61d510fbac2aad25613"
    end
  end

  def install
    bin.install "orbit"
  end

  test do
    assert_match "orbit", shell_output("#{bin}/orbit --version")
  end
end
