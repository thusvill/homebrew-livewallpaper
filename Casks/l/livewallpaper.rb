cask "livewallpaper" do
  version :latest
  sha256 :no_check

  url "https://github.com/thusvill/LiveWallpaperMacOS/releases/latest/download/LiveWallpaper.dmg"
  name "LiveWallpaper"
  desc "Open-source live wallpaper application"
  homepage "https://github.com/thusvill/LiveWallpaperMacOS"

  depends_on macos: :sonoma

  app "LiveWallpaper.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-d", "com.apple.quarantine", "{{appdir}}/LiveWallpaper.app"],
        sudo:         false,
        print_stderr: false,
        must_succeed: false
  end

  zap trash: "/Applications/LiveWallpaper.app"
end
