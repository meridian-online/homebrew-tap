class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://meridian.online/brightfield"
  license "MIT"

  depends_on :macos

  # Leave the finetype extension's @rpath install name as packaged: rewriting
  # it changes the file, and the application then refuses the extension as not
  # the one bundle-manifest.sha256 records.
  preserve_rpath if respond_to?(:preserve_rpath)

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.7/brightfield-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "6000cd2f794629c738877bd2c776b6a38140d980a4b55fb628de54bd9019ae40"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.7/brightfield-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "58ba04c6b3f01d84e8bd8a9f4b4453bb67b03b235c8f1e88e629544e3df59867"
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
