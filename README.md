# Meridian Homebrew Tap

Homebrew formulae for [Meridian](https://meridian.online) tools.

## Installation

```bash
brew tap meridian-online/tap
brew install finetype
brew install brightfield
```

Or install directly:

```bash
brew install meridian-online/tap/finetype
brew install meridian-online/tap/brightfield
```

## Available Formulae

| Formula | Description |
|---|---|
| [finetype](https://github.com/meridian-online/finetype) | Semantic type classifier for data profiling — detects 151 data types from raw strings |
| [brightfield](https://github.com/meridian-online/brightfield) | Grammar-of-graphics renderer for Meridian data (macOS only) |

## Updating

The `finetype` formula is bumped automatically when a new release is published.
The `brightfield` formula is updated manually per release, so a new version may
land in the tap a little after its GitHub release. To get the latest of either:

```bash
brew update
brew upgrade finetype
brew upgrade brightfield
```
