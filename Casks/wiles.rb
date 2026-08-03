cask "wiles" do
  version "0.1.3"
  sha256 "cebab85a3df80e974db57c5e56fd26a065f2f1c10f6f3a214e5f0551dbcf3fdc"

  url "https://raw.githubusercontent.com/marcops/wiles/f66ced5ed6ce71f755f68e9cf8729a44d3d2e91f/releases/wiles-v#{version}.zip"
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
