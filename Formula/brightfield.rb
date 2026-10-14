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
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.6/brightfield-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "651ceb293affe65845ff8efb38633b2dd63fd068982abf6ca6157102cc6ccdd6"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.6/brightfield-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "ce8a05f9f6faba88aea053794a4dc32e27a90f7ca1b04f41d5bff02bd33e2e73"
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
