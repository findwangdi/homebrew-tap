# Homebrew Tap for CodexTally

Install [CodexTally](https://github.com/findwangdi/CodexTally) with:

```bash
brew install --cask --no-quarantine findwangdi/tap/codex-tally
```

CodexTally is currently ad-hoc signed rather than Apple-notarized, so the explicit `--no-quarantine` flag is required. The Cask pins the SHA-256 checksum of the published universal release.

Uninstall the app while keeping its local cache:

```bash
brew uninstall --cask codex-tally
```

Remove the app and its derived local cache:

```bash
brew uninstall --cask --zap codex-tally
```
