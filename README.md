# Homebrew Tap for CodexTally

Install [CodexTally](https://github.com/findwangdi/CodexTally) with:

```bash
brew install findwangdi/tap/codex-tally
```

Homebrew builds the English-only CodexTally interface locally from the tagged MIT-licensed source, verifies the source SHA-256, and installs a `codex-tally` launcher. No Gatekeeper bypass is required.

Launch it with:

```bash
codex-tally
```

Uninstall the app while keeping its local cache:

```bash
brew uninstall codex-tally
```

The formula never removes `~/Library/Application Support/CodexTally`; uninstalling preserves derived local caches.
