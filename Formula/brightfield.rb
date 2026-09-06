class Brightfield < Formula
  desc "Grammar-of-graphics renderer for Meridian data (macOS)"
  homepage "https://github.com/meridian-online/brightfield"
  license "MIT"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.4/brightfield-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "38bfb871329a36cda35016277f5726b4a6fd4b301163fdbb83d2b3f5cbb0cd49"
    else
      url "https://github.com/meridian-online/brightfield/releases/download/v0.1.4/brightfield-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "a46ca60e50cee07400896025d8f826ca86f0ec911412099502700d5d885909f9"
    end
  end

  def install
    # The tarball's whole tree, not the binary alone: LICENSE, README.txt,
    # examples/, and — once the release stages one — finetype/, the FineType
    # bundle `brightfield_engine::semantic::bundle_beside` looks for beside
    # the resolved executable. libexec rather than bin because bin is on the
    # user's PATH, not a place for a model directory.
    #
    # A plain `bin.install_symlink` does NOT work here, and this is not a
    # style preference: `std::env::current_exe` on macOS reports the path the
    # process was execve'd with, unresolved — `_NSGetExecutablePath` does not
    # chase symlinks. Measured directly against the real installed binary: a
    # `bin/brightfield -> ../libexec/brightfield` symlink still reports
    # `bin/brightfield` as its own location, so `bundle_beside` looks in
    # `bin/finetype` and finds nothing. `write_exec_script` writes a small
    # `exec "<libexec path>" "$@"` wrapper instead; the child process is
    # execve'd with the libexec path directly, so `current_exe` reports
    # `libexec/brightfield` and `bundle_beside` finds `libexec/finetype`.
    # Proven both ways in the pull request.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"brightfield"
  end

  test do
    assert_match "brightfield", shell_output("#{bin}/brightfield --version")

    # `--check-type-source` exits 2 specifically when
    # `brightfield_engine::semantic::bundle_beside` finds no `finetype/`
    # beside the resolved executable — see brightfield-shell/src/main.rs's
    # `check_type_source`. The `bin/brightfield` wrapper this formula
    # installs execve's `libexec/brightfield` directly, so `current_exe`
    # inside the real binary reports the `libexec` path and `bundle_beside`
    # looks there — so exit 2 here means the FORMULA lost the bundle on the
    # way in, not that the bundle itself is bad (that is a packaging-time
    # property, not this formula's). A build with no bundle staged reports
    # absence honestly; this only refuses the layout discarding one that
    # was there.
    output = `#{bin}/brightfield --check-type-source 2>&1`
    status = Process.last_status.exitstatus
    refute_equal 2, status,
      "brightfield --check-type-source found no bundle beside the installed " \
      "executable, so the formula discarded the tarball's finetype/ tree:\n#{output}"
  end
end
