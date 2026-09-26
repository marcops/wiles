cask "wiles" do
  version "0.5.0"
  sha256 "da09a5ce20b871985c31946e6193c5e510f4883eb581058146538dc8d35c994a"

  url "https://github.com/marcops/wiles/releases/download/v#{version}/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager"
  homepage "https://github.com/marcops/wiles"

  depends_on macos: :sonoma

  app "Wiles.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Wiles.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.marco.wiles.plist",
    "~/Library/Saved Application State/com.marco.wiles.savedState",
    "~/Library/Caches/Wiles",
  ]
end
