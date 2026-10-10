cask "livewallpaper" do
  version :latest
  sha256 :no_check

  url "https://github.com/thusvill/LiveWallpaperMacOS/releases/latest/download/LiveWallpaper.dmg"
  name "LiveWallpaper"
  desc "Animated desktop wallpapers"
  homepage "https://github.com/thusvill/LiveWallpaperMacOS"

  depends_on macos: :sonoma

  app "LiveWallpaper.app"

  zap trash: [
    "~/Library/Application Support/LiveWallpaper",
    "~/Library/Caches/com.thusvill.LiveWallpaper",
    "~/Library/Preferences/com.thusvill.LiveWallpaper.plist",
  ]
end
