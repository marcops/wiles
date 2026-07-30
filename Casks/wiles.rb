cask "wiles" do
  version "0.0.5"
  sha256 "8037d92eaa0a89a91e76cf9f7273c7bbb051be74f9a59fbe2dca24e144101967"

  url "https://raw.githubusercontent.com/marcops/wiles/080325ed9031decd48d1d2d605f85a9e8607483f/releases/wiles-v#{version}.zip"
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
