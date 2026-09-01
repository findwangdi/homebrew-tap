cask "codex-tally" do
  version "0.3.0"
  sha256 "fbc55bbeb8410802f71314064d00211b41b47b12dde7449e95b08ba6ed6e969c"

  url "https://github.com/findwangdi/CodexTally/releases/download/v#{version}/CodexTally-macos-universal.zip",
      verified: "github.com/findwangdi/CodexTally/"
  name "CodexTally"
  desc "Native, local-first Codex usage meter for the menu bar"
  homepage "https://github.com/findwangdi/CodexTally"

  depends_on macos: :sonoma

  app "CodexTally.app"

  zap trash: [
    "~/Library/Application Support/CodexTally",
    "~/Library/Preferences/com.findwangdi.CodexTally.plist",
  ]

  caveats <<~EOS
    CodexTally is currently ad-hoc signed, not Apple-notarized.
    Install this Cask with --no-quarantine, as shown in the tap README.
  EOS
end
