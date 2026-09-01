class CodexTally < Formula
  desc "Native, local-first Codex usage meter for the menu bar"
  homepage "https://github.com/findwangdi/CodexTally"
  url "https://github.com/findwangdi/CodexTally/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9234b2c56f46f3b5d42d32f450e12ccaefbd282bea92903824109ed1c9470d25"
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
