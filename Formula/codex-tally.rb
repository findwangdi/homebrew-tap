class CodexTally < Formula
  desc "Native, local-first Codex usage meter for the menu bar"
  homepage "https://github.com/findwangdi/CodexTally"
  url "https://github.com/findwangdi/CodexTally/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "eed41af5a92d9f6db36b0db9c5bbc09a56b58a84e260428b0b08ceac15406e86"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "./scripts/package_app.sh"
    libexec.install ".build/CodexTally.app"
    (bin/"codex-tally").write <<~SH
      #!/bin/bash
      /usr/bin/open "#{libexec}/CodexTally.app"
    SH
  end

  def caveats
    <<~EOS
      Run `codex-tally` to launch the menu bar app.
      The app is built locally from source, so no Gatekeeper bypass is required.
    EOS
  end

  test do
    app = libexec/"CodexTally.app"
    assert_path_exists app/"Contents/Resources/en.lproj/Localizable.strings"
    refute_path_exists app/"Contents/Resources/zh-Hans.lproj"
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", app
  end
end
