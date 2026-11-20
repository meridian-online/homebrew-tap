# Brightfield cask Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** brightfield's release writes a Homebrew cask for the notarised `Brightfield.app` into the tap in place of the formula, with every formula check moved to the cask.

**Architecture:** The formula's generator, layout check, asset check, install checks and their self-tests in brightfield are each replaced by a cask counterpart with the same role and the same exit-code contract (0 clean, 1 a real fault, 2 could not run). `release.yml`'s `update-homebrew` job writes the cask, deletes the formula and merges `tap_migrations.json` in one commit, and only from a notarised build.

**Tech Stack:** bash, GitHub Actions YAML, Homebrew 7 cask DSL (`preflight_steps`), Rust (`xtask` step and path lists only).

**Spec:** `docs/superpowers/specs/2026-11-20-brightfield-cask-design.md` in the tap repo. Code lives in brightfield, branch `release/homebrew-cask`.

## Global Constraints

- brightfield is public. No private planning ids, issue refs, private repo names or local paths in code, comments, commits or PR text.
- Cask token `brightfield`; tap `meridian-online/tap`; file `Casks/brightfield.rb`.
- Asset names: `brightfield-<tag>-aarch64-apple-darwin.dmg` and `brightfield-<tag>-x86_64-apple-darwin.dmg`, each with a `.sha256` sidecar.
- Cask shape (proven on Homebrew 7.0.14 in a scratch tap; the reference copy is the spike below): `arch arm: "aarch64", intel: "x86_64"`; `sha256 arm:, intel:`; `url "<base>/brightfield-v#{version}-#{arch}-apple-darwin.dmg"`; livecheck with `strategy :page_match` on `https://github.com/meridian-online/brightfield/releases.atom` and `regex(%r{/releases/tag/v?(\d+(?:\.\d+)+)["<]}i)`; `depends_on :macos`; `app "Brightfield.app"`; `binary "brightfield.wrapper.sh", target: "brightfield"`; a `preflight_steps` block that (1) `run`s `/bin/sh -c` refusing the install, naming `brew uninstall --formula brightfield`, when `${HOMEBREW_PREFIX}/bin/brightfield` resolves into `/Cellar/brightfield/`, (2) `write_file`s the shim `#!/bin/sh` + `exec '{{appdir}}/Brightfield.app/Contents/MacOS/brightfield' "$@"`, (3) `set_permissions` it `0755`; `zap trash:` the `online.meridian.brightfield` support, caches, preferences and saved-state paths.
- No `preflight do` Ruby blocks (deprecated in Homebrew 7), no `conflicts_with formula:` (removed).
- `tap_migrations.json` gains `"brightfield": "meridian-online/tap/brightfield"` and keeps every other key.
- The release refuses to write the cask unless the build job's `signing` output is `notarised`.
- Each check script keeps exit codes 0 / 1 / 2 as the script it replaces documents them.
- Comments follow the repo's style, explaining why, and pass `cargo xtask ci --step comment-citations`.

## Review Focus

1. A tap whose `tap_migrations.json` already holds other keys, or does not exist: the merge keeps the others and creates the file when absent (Task 3 test).
2. A release whose `signing` output is `adhoc` or empty: `update-homebrew` fails before touching the tap (Task 3 test).
3. A cask where the shim execs a relative path or the bare `brightfield` on PATH: the layout check refuses it (Task 1 test).
4. A cask whose url template loses `#{arch}`: the asset check would fetch the arm asset for both architectures and pass; it must refuse fewer than two distinct urls (Task 2 test).
5. Running a branch install with an older formula install still linked: refused with the uninstall message, not a silent skip (Task 5 `formula-linked` install).

---

### Task 1: Cask generator and layout check

**Files:**
- Create: `scripts/write-brightfield-cask.sh`, `scripts/check-cask-layout.sh`, `scripts/check-cask-layout-selftest.sh`
- Delete: `scripts/write-brightfield-formula.sh`, `scripts/check-formula-layout.sh`, `scripts/check-formula-layout-selftest.sh`
- Modify: `xtask/src/steps.rs` (step `formula-layout-selftest` → `cask-layout-selftest`), `.github/workflows/public-hygiene.yml` (the step that runs it), any xtask test naming the old step

**Interfaces:**
- Produces: `scripts/write-brightfield-cask.sh TAG BASE_URL ARM_SHA INTEL_SHA` → cask on stdout; exit 2 on bad usage (TAG must match `^v[0-9]`, each sha `^[0-9a-f]{64}$`). `BASE_URL` is the release download base without trailing slash; the url line is `url "${BASE_URL%/${TAG}}/v#{version}/brightfield-v#{version}-#{arch}-apple-darwin.dmg"` so the cask's url interpolates version.
- Produces: `scripts/check-cask-layout.sh <cask.rb>` exit 0 accepted, 1 refused (stderr names the rule), 2 unreadable.

- [ ] **Step 1: Write `check-cask-layout-selftest.sh`** in the style of the formula self-test it replaces (`expect_pass` / `expect_fail <name> <needle> <file>`): the generated cask passes; refusals for (a) no `app "Brightfield.app"`, (b) `binary` pointing at `Contents/MacOS/brightfield` (symlink), (c) shim exec of a relative path, (d) no formula refusal in `preflight_steps`, (e) a `preflight do` block, (f) url without `#{arch}`. Also: the generator exits 2 on a short sha and on tag `0.1.8`.
- [ ] **Step 2: Run it**, expect failure (scripts absent).
- [ ] **Step 3: Write the generator and the check.** The check reads the file as text: required lines and patterns per Global Constraints; refusal messages name what is missing.
- [ ] **Step 4: Run** `scripts/check-cask-layout-selftest.sh` → `ok` lines only, exit 0. Run `ruby -c` on a generated cask.
- [ ] **Step 5: Swap the xtask step and the public-hygiene step**, run `cargo xtask ci --step cask-layout-selftest` and `cargo xtask ci --step workflow-coverage` → pass. Run `--step fmt`, `--step clippy`.
- [ ] **Step 6: Commit** "Generate a Homebrew cask in place of the formula".

### Task 2: Cask asset check

**Files:**
- Create: `scripts/check-cask-asset.sh`, `scripts/check-cask-asset-selftest.sh` (from the formula ones, by `git mv` then edit)
- Modify: `xtask/src/steps.rs` (`formula-asset-selftest` → `cask-asset-selftest`), `.github/workflows/public-hygiene.yml`

**Interfaces:**
- Consumes: the cask text Task 1 writes.
- Produces: `scripts/check-cask-asset.sh [--min-pairs N] <cask.rb>`: reads `version`, the `arch arm:/intel:` values, the `sha256 arm:/intel:` values and the url template; expands `#{version}` and `#{arch}` per architecture; fetches each url and compares sha256. Exit 0/1/2 as the formula version.

- [ ] **Step 1: Adapt the self-test** (it serves fixtures over `file://` or a local server, as the formula one does): passes on matching assets; 1 on a mismatched digest; 1 on a missing intel asset; 2 on fewer than `--min-pairs` pairs; 2 when the url lacks `#{arch}` (two identical urls).
- [ ] **Step 2: Run**, expect failure.
- [ ] **Step 3: Implement.**
- [ ] **Step 4: Run** `cargo xtask ci --step cask-asset-selftest` → pass; `workflow-coverage` → pass.
- [ ] **Step 5: Commit** "Check the cask's disk images against their checksums".

### Task 3: Release job writes the cask from a notarised build

**Files:**
- Create: `scripts/move-tap-to-cask.sh` (with cases added to `check-cask-layout-selftest.sh`), `scripts/require-notarised.sh` and `scripts/require-notarised-selftest.sh` (a new xtask step `require-notarised-selftest`, run from public-hygiene.yml beside the other packaging self-tests)
- Modify: `.github/workflows/release.yml` (`update-homebrew` job and the header comment), `scripts/check-release-tag.py` (mutation at line ~630 that patches `    needs: release\n`)

**Interfaces:**
- Produces: `scripts/move-tap-to-cask.sh TAPDIR` — removes `TAPDIR/Formula/brightfield.rb` if present; writes `TAPDIR/tap_migrations.json` with the brightfield key added, other keys kept, sorted, 2-space JSON, created when absent; exit 2 when TAPDIR is not a directory or the JSON does not parse. Uses `python3` (present on ubuntu-latest).
- Produces: `scripts/require-notarised.sh SIGNING` — exit 0 when SIGNING is exactly `notarised`; exit 1 with `::error::` naming the value for `adhoc`, an empty value or anything else. Its self-test also reads release.yml and fails when `update-homebrew` does not run it as its first step with the build's signing output through `env:`, or when that step carries an `if:` or `continue-on-error:`.

- [ ] **Step 1: Add self-test cases**: no json → created with one key; json with `{"other": "x/y/z"}` → both keys; formula present → removed; invalid json → exit 2 and file untouched.
- [ ] **Step 1b: Write `require-notarised-selftest.sh`**: `notarised` → 0; `adhoc`, empty and `Notarised` → 1; plus the release.yml wiring assertions above.
- [ ] **Step 2: Run**, expect failure. **Step 3: Implement.** **Step 4: Run** → pass.
- [ ] **Step 5: Edit `update-homebrew`**: `needs: [build, release]`; first step runs `scripts/require-notarised.sh "$SIGNING"` with `SIGNING: ${{ needs.build.outputs.signing }}` in `env:` (the build job already declares that output); download the two `.dmg.sha256` sidecars; write `homebrew-tap/Casks/brightfield.rb` with `write-brightfield-cask.sh`; `check-cask-layout.sh`; check the cask names the tag's version; `ruby -c`; `check-cask-asset.sh --min-pairs 2`; `move-tap-to-cask.sh homebrew-tap`; `git add -A Casks Formula tap_migrations.json`; same commit title `Update brightfield to ${GITHUB_REF_NAME}`. Rewrite the job's and the file header's comments for the cask.
- [ ] **Step 6: Update `check-release-tag.py`'s mutation** to the new `needs:` line. Run `cargo xtask ci --step` for the release-tag wiring and rehearsal steps (find their names with `cargo xtask ci --list`) → pass.
- [ ] **Step 7: Commit** "Write the cask from a notarised release and retire the formula".

### Task 4: Install check reads the published cask

**Files:**
- Modify: `scripts/check-brew-install.sh`, `scripts/check-brew-install-selftest.sh`, `.github/workflows/brew-install.yml` (comments)

**Interfaces:**
- Produces: `scripts/check-brew-install.sh --tag vX.Y.Z [--tap OWNER/NAME] [--allow-local] [--appdir DIR]` — moves the tap to the commit titled `Update brightfield to <tag>`, `brew install --cask <tap>/brightfield` (with `--appdir` when given), requires the Caskroom version to be the tag's, then runs and reports each regardless of the others: `spctl -a -vv -t exec <app>` must say `source=Notarized Developer ID`; `brightfield --check-type-source` exit 0; `brightfield --check-engine` exit 0; `readlink` of `$(brew --prefix)/bin/brightfield` must be the shim, not the app binary.

- [ ] **Step 1: Update the self-test's stubs and cases** (it stubs `brew`, `git`, `spctl`): cask install is called with `--cask`; an `spctl` answer without `Notarized Developer ID` → exit 1; a version mismatch → exit 1; the workflow-wiring assertions stay.
- [ ] **Step 2: Run**, expect failure. **Step 3: Implement.** **Step 4: Run** `cargo xtask ci --step brew-install-selftest` → pass.
- [ ] **Step 5: Commit** "Install the cask in the release's install check".

### Task 5: Branch install check installs the branch's disk image

**Files:**
- Modify: `scripts/check-brew-install-branch.sh`, `.github/workflows/brew-install-branch.yml`, `xtask/src/gate.rs` (`BREW_INSTALL_BRANCH_PATHS` and its tests)

**Interfaces:**
- Consumes: Tasks 1 and 4.
- Produces: `scripts/check-brew-install-branch.sh DIST TAG [--allow-local] [--appdir DIR]`; DIST holds `brightfield-TAG-aarch64-apple-darwin.dmg`. Four installs through a local git tap, each with the cask from `write-brightfield-cask.sh` pointed at a `file://` copy:
  - `packaged`: passes `--check-type-source` and `--check-engine` through the shim.
  - `symlinked`: the cask's `binary` swapped for the app binary itself; `--check-type-source` exits 2 (no type source), proving the shim is needed.
  - `tampered`: a copy of the .dmg with one byte of the FineType extension changed (rebuild the image with `hdiutil`); `--check-type-source` refuses it.
  - `formula-linked`: before installing, `$(brew --prefix)/bin/brightfield` is made a symlink into `$(brew --prefix)/Cellar/brightfield/0.0.0-fixture/bin/brightfield` (only when nothing is at that path; removed afterwards whatever happens); `brew install --cask` must exit non-zero, its output must name `brew uninstall --formula brightfield`, and the symlink must be unchanged.
  It clears quarantine (`xattr -dr com.apple.quarantine`) on the installed app only when `spctl` does not report it notarised, and says so in the log. The spctl verdict is printed either way.

- [ ] **Step 1: Rewrite the script** around the four installs; drop the `preserve_rpath` case and say why in the header (casks do not relocate dylibs).
- [ ] **Step 2: Update `BREW_INSTALL_BRANCH_PATHS`** for the renamed scripts; run `cargo test -p xtask` → pass.
- [ ] **Step 3: Run it locally** against the notarised v0.1.8 image: `DIST=$(mktemp -d)`, copy the image there as `brightfield-v0.1.8-aarch64-apple-darwin.dmg`, `scripts/check-brew-install-branch.sh "$DIST" v0.1.8 --allow-local --appdir <scratch>` → exit 0 with all four installs as required. Remove the local tap and installs afterwards.
- [ ] **Step 4: Commit** "Install the branch's disk image through a cask".

### Task 6: Docs, and the tap README

**Files:**
- Modify (brightfield): `README.md` (install section and the release paragraph), comments in `scripts/package.sh`, `scripts/set-extension-rpath-id.sh`, `CLAUDE.md` if it names the formula
- Modify (tap, branch `cask-replaces-formula`): `README.md`

- [ ] **Step 1:** brightfield README: `brew install meridian-online/tap/brightfield` now installs the app and the `brightfield` command; a formula install migrates on `brew update` once the cask is trusted, or `brew uninstall --formula brightfield` first. Release paragraph names the cask.
- [ ] **Step 2:** Tap README: brightfield is a cask (app plus command, macOS, notarised); migration commands (`brew trust --cask meridian-online/tap/brightfield` then `brew update`, or uninstall the formula and install); the cask is generated by brightfield's release, like the formula was.
- [ ] **Step 3:** `grep -rn "formula" scripts .github README.md` in brightfield → each remaining hit is about finetype or deliberate history.
- [ ] **Step 4: Commit** each repo.

### Final verification (before the pull requests)

- Generate a cask with `write-brightfield-cask.sh` for v0.1.8, point its url at the local notarised image, put it in a scratch git tap, and run `brew install --cask` (scratch `--appdir`), `brew audit --cask --new`, `brew style`, and the migration from an installed formula with the cask trusted. Expected: install and audit clean; the migration installs the cask and unlinks the formula. Clean up the tap, installs, trust entry and developer mode afterwards.
- brightfield full gate: `cargo xtask gate <pr>` (about an hour).
