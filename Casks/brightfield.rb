cask "brightfield" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.9"
  sha256 arm:   "346b95d2b7bb16a647d7416852a537d3ca16b06e26e9a25da231aa27bc043486",
         intel: "55a05d548f3737d0423e44e329780e7360d2f3f033d377bbb28c6689f87c3158"

  url "https://github.com/meridian-online/brightfield/releases/download/v#{version}/brightfield-v#{version}-#{arch}-apple-darwin.dmg"
  name "Brightfield"
  desc "Grammar-of-graphics renderer for Meridian data"
  homepage "https://meridian.online/brightfield"

  # Every release so far is a GitHub prerelease, which the GitHub strategies
  # skip; the releases feed lists them all.
  livecheck do
    url "https://github.com/meridian-online/brightfield/releases.atom"
    strategy :page_match
    regex(%r{/releases/tag/v?(\d+(?:\.\d+)+)["<]}i)
  end

  depends_on :macos

  app "Brightfield.app"
  binary "brightfield.wrapper.sh", target: "brightfield"

  preflight_steps do
    run "/bin/sh", args: ["-c", <<~SH]
      prefixes="/opt/homebrew /usr/local"
      [ -n "${HOMEBREW_PREFIX:-}" ] && prefixes="$HOMEBREW_PREFIX $prefixes"
      for prefix in $prefixes; do
        link="$prefix/bin/brightfield"
        case "$(readlink "$link" 2>/dev/null)" in
          */Cellar/brightfield/*)
            echo "The brightfield formula is still installed, and it owns $link." >&2
            echo "Remove it first:  brew uninstall --formula brightfield" >&2
            exit 1 ;;
        esac
      done
    SH
    write_file "brightfield.wrapper.sh", <<~SH
      #!/bin/sh
      exec '{{appdir}}/Brightfield.app/Contents/MacOS/brightfield' "$@"
    SH
    set_permissions "brightfield.wrapper.sh", "0755"
  end

  zap trash: [
    "~/Library/Application Support/online.meridian.brightfield",
    "~/Library/Caches/online.meridian.brightfield",
    "~/Library/Preferences/online.meridian.brightfield.plist",
    "~/Library/Saved Application State/online.meridian.brightfield.savedState",
  ]
end
