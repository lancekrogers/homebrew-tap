cask "clipsync" do
  version "0.1.1"
  sha256 "9d225d23edc145a589b5d7173eaae24b809b6f2bb70f00b0dfa7df83a63a3a7c"

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
