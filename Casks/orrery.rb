# Homebrew Cask for Orrery (renamed from Mission Control in v2.0.0).
#
# This installs the DMG from GitHub Releases. It works whether or not the app
# is notarized; if it isn't, macOS shows a one-time "Open Anyway" prompt (see
# the README).
#
#     brew install --cask jokeane9/tap/orrery
#
# Renamed from the `mission-control-desktop` token; cask_renames.json at the tap
# root maps the old token onto this one, so existing installs follow the rename
# on `brew upgrade` instead of silently never seeing another update. Homebrew
# uninstalls the old artifacts (including "Mission Control.app") from the
# recorded receipt first, so nobody ends up with two apps.
#
# `version` + `sha256` are rewritten automatically by the bump-tap job on each
# release — it only ever touches those two lines, so the `url` template below
# must already be right. It points at the v2.0.0-and-later artifact naming
# (Orrery-<version>.dmg in the renamed repo); the version below is still the
# last Mission-Control-era release and is replaced the moment v2.0.0 publishes.
#
# Checksum by hand, if ever needed:
#     shasum -a 256 dist/Orrery-<version>.dmg
cask "orrery" do
  version "2.2.0"
  sha256 "83c8f1e430cce9404a47e1b4138f3aeb03cf4b93d8e7d3a882e8e99b9a63c048"

  url "https://github.com/jokeane9/orrery/releases/download/v#{version}/Orrery-#{version}.dmg"
  name "Orrery"
  desc "One window, every project's live git state"
  homepage "https://github.com/jokeane9/orrery"

  depends_on :macos

  app "Orrery.app"

  # Both paths: pre-2.0 config lived under the old app name, and an upgraded
  # install has a copy at each (the app migrates by copying, so the old dir
  # survives on purpose). Zap means "remove every trace" — leaving the legacy
  # dir behind would betray that.
  zap trash: [
    "~/Library/Application Support/Orrery",
    "~/Library/Application Support/Mission Control",
  ]

  caveats <<~EOS
    Orrery isn't notarized yet, so macOS blocks it on first launch with
    "Apple could not verify that 'Orrery' is free of malware."

    To open it (one time):
      System Settings → Privacy & Security → scroll to Security → "Open Anyway"

    Every launch after that opens normally. It's an ad-hoc-signed open-source
    app — the source is at the homepage above.
  EOS
end
