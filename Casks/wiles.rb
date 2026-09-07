cask "wiles" do
  version "0.4.5"
  sha256 "c43cb17f93dd9c789ab69a0b13ab47d950777cb5f2199f9985c0329265d75a24"

  url "https://github.com/marcops/wiles/releases/download/v#{version}/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager"
  homepage "https://github.com/marcops/wiles"

  depends_on macos: :sonoma

  app "Wiles.app"

  postflight_steps do
    run "xattr", args: ["-cr", "Wiles.app"], base: :appdir
  end

  zap trash: [
    "~/Library/Preferences/com.marco.wiles.plist",
    "~/Library/Saved Application State/com.marco.wiles.savedState",
    "~/Library/Caches/Wiles",
  ]
end
