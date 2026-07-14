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
  version "1.4.1"
  sha256 "070a2d72eeb5997edcd446ea5acdabf5047a09b6f680dc7beb54671e4fa6f239"

  url "https://github.com/jokeane9/mission-control-desktop/releases/download/v#{version}/MissionControl-#{version}.dmg"
  name "Mission Control"
  desc "One window, every project's live git state"
  homepage "https://github.com/jokeane9/mission-control-desktop"

  app "Mission Control.app"

  zap trash: [
    "~/Library/Application Support/Mission Control",
  ]
end
