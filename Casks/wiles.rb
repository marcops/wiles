cask "wiles" do
  version "0.2.0"
  sha256 "d28f8ea5e5eb3d1658a54024366e5cce7101c734600522f243e70afcf742b814"

  url "https://raw.githubusercontent.com/marcops/wiles/831b4edbd7a1acc4f0af5b4b259ebae5d6e0ff52/releases/wiles-v#{version}.zip"
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
