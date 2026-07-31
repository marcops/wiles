cask "wiles" do
  version "0.0.8"
  sha256 "6ca3fdfe30055e97275a3f02797bcd8272ada97fb46762bd9f91a99d9c2b5b24"

  url "https://raw.githubusercontent.com/marcops/wiles/725b05eb2c6f0bb93014c6ef5fec79e9885becf5/releases/wiles-v#{version}.zip"
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
