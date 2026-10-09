cask "livewallpaper" do
  version :latest
  sha256 :no_check

  url "https://github.com/thusvill/LiveWallpaperMacOS/releases/latest/download/LiveWallpaper.dmg"
  name "LiveWallpaper"
  desc "Live wallpaper application"
  homepage "https://github.com/thusvill/LiveWallpaperMacOS"

  depends_on macos: ">= :sonoma"

  app "LiveWallpaper.app"

  postflight_steps do
    system_command "/usr/bin/xattr",
                   args:         ["-d", "com.apple.quarantine", "#{appdir}/LiveWallpaper.app"],
                   sudo:         false,
                   print_stderr: false
  rescue
    opoo "com.apple.quarantine attribute not found or could not be removed"
  end

  zap trash: [
    "~/Library/Application Support/LiveWallpaper",
    "~/Library/Caches/com.thusvill.LiveWallpaper",
    "~/Library/Preferences/com.thusvill.LiveWallpaper.plist",
  ]
end