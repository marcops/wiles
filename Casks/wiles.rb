cask "wiles" do
  version "0.0.10"
  sha256 "623adb1bc3743a794a7ca12bddc550b5f7aad938f00f4ecb927e1ae5d4d0fecb"

  url "https://raw.githubusercontent.com/marcops/wiles/293e2740db846aee82da2d7d67252dd1ce3939d2/releases/wiles-v#{version}.zip"
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
