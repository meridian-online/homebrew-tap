class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://meridian.online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.5/brightfield-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "d4f180d949cdf300a6a12b7bb098c83eb18d991212d2fd48a93c220fcb4ae892"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.5/brightfield-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "460af8a6b6a3b4b971bb4395bc6a66f6a930586d7d12c9647ea85121e218b71d"
    end
  end

  # The whole tarball, not the binary alone. finetype/ is the semantic type
  # classifier and it has to stay beside the executable; an exec script rather
  # than a symlink because current_exe() on macOS does not resolve one, so a
  # symlinked binary looks for the bundle in bin/ and finds nothing.
  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"brightfield"
  end

  test do
    assert_match "brightfield", shell_output("#{bin}/brightfield --version")
    # Exits 0 only when the bundled extension loaded, the model beside it
    # loaded, and a column got a label; shell_output raises on anything else,
    # and exit 2 is "no bundle found" — what an install that dropped the tree
    # around the binary looks like. The path it reports is the assertion:
    # libexec means current_exe() resolved to the real binary, which is the
    # whole reason this formula writes an exec script instead of a symlink.
    assert_match "libexec/finetype", shell_output("#{bin}/brightfield --check-type-source")
  end
end
