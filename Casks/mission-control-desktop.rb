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
  version "1.2.0"
  sha256 "fccd47d20f9f17b3604a189be0293d153652f9139e90682ee9f4da49b21c5208"

  url "https://github.com/jokeane9/mission-control-desktop/releases/download/v#{version}/MissionControl-#{version}.dmg"
  name "Mission Control"
  desc "One window, every project's live git state"
  homepage "https://github.com/jokeane9/mission-control-desktop"

  app "Mission Control.app"

  zap trash: [
    "~/Library/Application Support/Mission Control",
  ]
end
