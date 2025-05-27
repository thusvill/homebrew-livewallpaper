cask "rollplay" do
  version "1.2.4"
  sha256 :no_check

  url "https://github.com/thusvill/LiveWallpaperMacOS/releases/download/V#{version}/RollPlay-Silicon.dmg"
  name "RollPlay"
  desc "Open-source live wallpaper application"
  homepage "https://github.com/thusvill/LiveWallpaperMacOS"

  depends_on macos: ">= :sequoia"

  app "RollPlay.app"

  postflight do
    # macOS may not always apply quarantine attribute; ignore error if missing

    system_command "/usr/bin/xattr",
                   args:         ["-d", "com.apple.quarantine", "/Applications/RollPlay.app"],
                   sudo:         false,
                   print_stderr: false
  rescue
    opoo "com.apple.quarantine attribute not found or could not be removed"
  end

  zap trash: "/Applications/RollPlay.app"
end
