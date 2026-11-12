cask "clipsync" do
  version "0.1.0"
  sha256 "03ba5c148fa2e19310551cf64c38ed3e4408254d0e77a6c3b78289500c6b4b7f"

  url "https://github.com/lancekrogers/clipsync/releases/download/v#{version}/ClipSync-#{version}-macos-arm64-unsigned.dmg"
  name "ClipSync"
  desc "Clipboard sync between trusted Mac and Linux computers"
  homepage "https://github.com/lancekrogers/clipsync"

  depends_on arch: :arm64

  app "ClipSync.app"
  binary "#{appdir}/ClipSync.app/Contents/MacOS/clipsync"

  # Not notarized; the bundle carries an ad-hoc signature.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ClipSync.app"]
  end

  # The background service runs from the app, so uninstall only quits the GUI
  # and leaves settings, paired devices, history and the LaunchAgent in place.
  uninstall quit: "com.clipsync.desktop"

  zap launchctl: "com.clipsync",
      trash:     [
        "~/.config/clipsync",
        "~/.local/share/clipsync",
        "~/Library/Application Support/clipsync",
        "~/Library/LaunchAgents/com.clipsync.plist",
      ]
end
