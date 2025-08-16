cask "livewallpaper" do
  version :latest
  sha256 :no_check

  url "https://github.com/thusvill/LiveWallpaperMacOS/releases/latest/download/LiveWallpaper.dmg",
      verified: "github.com/thusvill/LiveWallpaperMacOS/"

  name "LiveWallpaper"
  desc "Open-source live wallpaper application"
  homepage "https://github.com/thusvill/LiveWallpaperMacOS"

  depends_on macos: ">= :sequoia"

  app "LiveWallpaper.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-d", "com.apple.quarantine", "/Applications/LiveWallpaper.app"],
                   sudo:         false,
                   print_stderr: false
  rescue
    opoo "com.apple.quarantine attribute not found or could not be removed"
  end

  zap trash: "/Applications/LiveWallpaper.app"
end
