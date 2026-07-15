# Homebrew Cask for Mission Control.
#
# This installs the DMG from GitHub Releases. It works whether or not the app
# is notarized; if it isn't, macOS shows a one-time "Open Anyway" prompt (see
# the README). Publish it by copying this file into a tap repo named
# `homebrew-tap` under your account, so users can run:
#
#     brew install --cask jokeane9/tap/mission-control-desktop
#
# Update `version` and `sha256` on each release. Get the checksum with:
#     shasum -a 256 dist/MissionControl-<version>.dmg
cask "mission-control-desktop" do
  version "1.5.0"
  sha256 "09a2d2a31f079f640fe6bdfe8f2f7880026db1e00f1737bef64e8490a5f77f52"

  url "https://github.com/jokeane9/mission-control-desktop/releases/download/v#{version}/MissionControl-#{version}.dmg"
  name "Mission Control"
  desc "One window, every project's live git state"
  homepage "https://github.com/jokeane9/mission-control-desktop"

  depends_on :macos

  app "Mission Control.app"

  zap trash: "~/Library/Application Support/Mission Control"

  caveats <<~EOS
    Mission Control isn't notarized yet, so macOS blocks it on first launch with
    "Apple could not verify that 'Mission Control' is free of malware."

    To open it (one time):
      System Settings → Privacy & Security → scroll to Security → "Open Anyway"

    Every launch after that opens normally. It's an ad-hoc-signed open-source
    app — the source is at the homepage above.
  EOS
end
