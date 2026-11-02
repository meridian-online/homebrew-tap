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
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.8/brightfield-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "a24e7cfc04296add0b43b1502e487f6bb448bf6346b72e2acc10bf92e93d2f95"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.8/brightfield-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "e1d261c038cf03bc210e03b4ad6c1ed7db72e3aa3ecf6bcf00aea725170248c5"
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
