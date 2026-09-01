class CodexTally < Formula
  desc "Native, local-first Codex usage meter for the menu bar"
  homepage "https://github.com/findwangdi/CodexTally"
  url "https://github.com/findwangdi/CodexTally/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "581743da23ea4ee47459c59850e73b9eca15fd7eb16916c1db564f81fa2091db"
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
    assert_path_exists app/"Contents/Resources/zh-Hans.lproj/Localizable.strings"
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", app
  end
end
