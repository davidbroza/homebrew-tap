cask "davidcast" do
  version "0.1.0"

  on_arm do
    sha256 "3e47aafb778b15f8e80f81cdb134605f0d0e05a00bec16c5ad7592c8b5936f99"
    url "https://github.com/davidbroza/davidcast/releases/download/v#{version}/davidcast-v#{version}-aarch64.app.tar.gz"
  end
  on_intel do
    sha256 "3deeabc0dbcf3092b94157dca92e59f21ab25ac7f0702f98ab1c48a1e1cdc195"
    url "https://github.com/davidbroza/davidcast/releases/download/v#{version}/davidcast-v#{version}-x86_64.app.tar.gz"
  end

  name "davidcast"
  desc "Keyboard-first launcher for macOS"
  homepage "https://github.com/davidbroza/davidcast"

  # davidcast self-updates via tauri-plugin-updater, so Homebrew should
  # not try to bump the version on `brew upgrade` — let the in-app
  # updater handle that.
  auto_updates true
  depends_on macos: ">= :ventura"

  app "davidcast.app"

  zap trash: [
    "~/Library/Application Support/davidcast",
    "~/Library/Logs/davidcast",
    "~/Library/Preferences/com.davidcast.app.plist",
    "~/Library/Saved Application State/com.davidcast.app.savedState",
  ]
end
