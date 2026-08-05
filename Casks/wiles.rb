cask "wiles" do
  version "0.2.1"
  sha256 "2f3ff6ae8a4d8f44317c0cd6b1b12508ee2a706f8120779a99f128d5e225c52b"

  url "https://raw.githubusercontent.com/marcops/wiles/main/releases/wiles-v#{version}.zip"
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
