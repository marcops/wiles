cask "wiles" do
  version "0.0.4"
  sha256 "b6e3a9c6ef581a67425a61c1b554f5bd19da3e1bb011c909191af5f86815957d"

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
