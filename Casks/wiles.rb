cask "wiles" do
  version "0.0.5"
  sha256 "41d6d5ccbdbf267dafdc2853ca8bf6cdc256406ec658dfedcfd6a6d5962fa890"

  url "https://raw.githubusercontent.com/marcops/wiles/10b60f79633e2e5f086610e6e41b17dcfc37615f/releases/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager"
  homepage "https://github.com/marcops/wiles"

  depends_on macos: :sonoma

  app "Wiles.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/Wiles.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.wiles.app.plist",
    "~/Library/Saved Application State/com.wiles.app.savedState",
  ]
end
