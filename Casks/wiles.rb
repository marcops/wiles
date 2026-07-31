cask "wiles" do
  version "0.0.8"
  sha256 "e34337411f7a299b0a08d42a9c7776eff157584d0180d0a9b5bfa43e5587d5df"

  url "https://raw.githubusercontent.com/marcops/wiles/60f72ba4d3d83dd2c063efdcb98835c07396403a/releases/wiles-v#{version}.zip"
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
