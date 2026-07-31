cask "wiles" do
  version "0.0.10"
  sha256 "dec98b3b1da90b61f4ea16a671ad60fc71bf923c2094f3327a802292f1a3a8fa"

  url "https://raw.githubusercontent.com/marcops/wiles/a2cfe14558a16a8e3426bb088e647316a7bec704/releases/wiles-v#{version}.zip"
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
