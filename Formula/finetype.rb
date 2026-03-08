class Finetype < Formula
  desc "Semantic type classifier for data profiling — detects data types from raw strings"
  homepage "https://noon.sh/projects/finetype/"
  license "MIT"
  version "0.6.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.8/finetype-v0.6.8-aarch64-apple-darwin.tar.gz"
      sha256 "c48150a92b2397bdd6269963d21580ccfa12886162cc27f979fcf9099e41429a"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.8/finetype-v0.6.8-x86_64-apple-darwin.tar.gz"
      sha256 "d3ecbee246e6f3d4d330cee64a41854ee00b900e1d3ef84eb3e1479bb018d051"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/noon-org/finetype/releases/download/v0.6.8/finetype-v0.6.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8292905131d152e77b91a146358d67c72d09330c0f4ca8ff09eee01bb71fcadd"
    else
      url "https://github.com/noon-org/finetype/releases/download/v0.6.8/finetype-v0.6.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca97ecf666c406c1f378d32c6751a7115ee8962d728e1ef6219f180cff6fdd9b"
    end
  end

  def install
    bin.install "finetype"
  end

  test do
    assert_match "finetype", shell_output("#{bin}/finetype --version")
  end
end
