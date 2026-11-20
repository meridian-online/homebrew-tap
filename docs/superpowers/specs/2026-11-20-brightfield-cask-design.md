# A Homebrew cask replaces the brightfield formula

## Intent

Brightfield is a macOS application, and a Homebrew user should get it as one: `Brightfield.app` in `/Applications`, an icon in the Dock, opening without a Gatekeeper prompt. The formula puts a bare executable in `bin`, which gives none of that. The cask replaces the formula rather than sitting beside it, so there is one Homebrew route to Brightfield, not two that drift apart.

## Goals

- `brew install meridian-online/tap/brightfield` installs the notarised `Brightfield.app` from the release's `.dmg` into the user's applications folder, and it opens with no Gatekeeper prompt.
- `brightfield` stays on the path, reaching the app's own binary, so the headless exports and `--check-type-source` keep working from a terminal.
- A user with the formula installed is migrated or told exactly what to run. Nobody ends up with a cask whose command silently points at the old formula.
- `brew audit --cask --new` passes, its Gatekeeper and notarisation check included.
- The release workflow writes the cask, removes the formula and records the migration in one tap commit, and only from a notarised build.

## Non-goals

- Linux or Windows installs. The cask is macOS only, as the formula was.
- Homebrew's official cask repository. The cask lives in this tap.
- Changing the app, its packaging or its signing.

## Anti-goals

- A cask that ships before a signed, notarised release. Homebrew quarantines a cask's download and no longer offers `--no-quarantine`, so an ad-hoc build would be refused at first launch. The release job fails rather than write a cask from an ad-hoc build.
- A `brightfield` command that is a symlink into the app. The binary finds its bundled type source from the path it was invoked by, which a symlink does not resolve. Measured: the v0.1.8 app's binary through a symlink reports no type source (exit 2); through an exec shim, exit 0.

## Constraints found by trial

These were measured on Homebrew 7.0.14 against a locally built, notarised v0.1.8 `.dmg`, through a scratch tap:

- Homebrew 7 deprecates `preflight` blocks in favour of declarative `preflight_steps`. The shim is written with `write_file` and `set_permissions`, and `{{appdir}}` expands to the user's applications folder.
- `conflicts_with formula:` no longer exists. With the formula still linked, `brew install --cask` only warns and skips linking `brightfield`. The cask therefore runs a `preflight_steps` check that refuses the install, naming `brew uninstall --formula brightfield`, when `bin/brightfield` still points into the formula's Cellar.
- `tap_migrations.json` mapping `brightfield` to `meridian-online/tap/brightfield` migrates a formula install to the cask on `brew update`: Homebrew unlinks the keg, installs the cask and asks the user to uninstall the formula. It does so automatically only when the user has trusted the cask (`brew trust --cask meridian-online/tap/brightfield`). Otherwise it prints the commands to run.
- The signing audit runs for a non-official tap only under `--new`. It passed against the notarised app.
- Every Brightfield release is a GitHub prerelease, and the GitHub livecheck strategies skip prereleases. A `page_match` check of the releases feed finds them.
- Casks do not relocate dylibs, so the formula's `preserve_rpath` problem does not arise for the cask.

## Approaches

1. **The release workflow generates the cask, as it generated the formula (chosen).** brightfield's `update-homebrew` job writes `Casks/brightfield.rb` from a script, removes `Formula/brightfield.rb`, merges the migration into `tap_migrations.json`, checks the cask's assets against their checksums and pushes one commit. The formula's generator and checks become the cask's. This keeps one source of truth with the tests that already guard it.
2. **A hand-maintained cask in the tap, bumped by a dispatch.** This would need its own CI in a tap that has none, and it would split the source of truth from the packaging it describes.
3. **The cask beside the formula.** Ruled out: the cask replaces the formula.

## The design

In brightfield:

- `scripts/write-brightfield-cask.sh TAG BASE_URL ARM_SHA INTEL_SHA` writes the cask: `arch`, `version`, per-arch `sha256`, a `.dmg` url, livecheck, `depends_on :macos`, `app`, the shim as `binary`, the refusal and shim in `preflight_steps`, and `zap`. It replaces `write-brightfield-formula.sh`.
- `scripts/check-cask-layout.sh` reads the generated cask and refuses one that drops the app, links `brightfield` as a symlink rather than the shim, lets the shim exec anything but the app's binary by absolute path, or drops the formula refusal. It replaces `check-formula-layout.sh`.
- `scripts/check-cask-asset.sh` expands the cask's url template once per architecture, fetches each asset and compares it with that architecture's sha256. It replaces `check-formula-asset.sh`.
- `scripts/check-brew-install.sh` installs the tap's cask for a tag, then checks that Gatekeeper accepts the installed app as notarised Developer ID, and that `brightfield --check-type-source` and `--check-engine` pass through the shim.
- `scripts/check-brew-install-branch.sh` installs the branch's `.dmg` through a local tap three ways: as generated (passes), with the shim swapped for a symlink (no type source, which proves the shim matters), and with the extension tampered (refused). The branch build is ad-hoc signed, so this check clears the quarantine Homebrew sets. What it tests is the install layout, not signing.
- `release.yml`'s `update-homebrew` job needs the build's signing record, and it fails unless the record says notarised. It writes the cask, removes the formula, merges `tap_migrations.json` and commits as before.
- Self-tests, the gate's path lists, and the README and docs that name the formula move with the scripts.

In the tap: the README describes the cask, how a formula install is migrated, and that the cask is generated. The first notarised release's tap commit is what adds the cask and removes the formula. The tap's pull request is merged after that release.

## Calls made without the operator

- The cask keeps the token `brightfield`, so the existing `brew install meridian-online/tap/brightfield` keeps working.
- A formula install that is still linked is refused with a message, rather than unlinked by the cask itself.
- The release job writes all three tap changes in one commit, so the tap never holds a migration without its cask.
- The branch install check clears quarantine on the ad-hoc build, and the release install check does not.
