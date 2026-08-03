cask "wiles" do
  version "0.1.2"
  sha256 "3c44aff6eec80be395eefcf5fcea1489353ebf5cc9493d53417c07361b99df43"

  url "https://raw.githubusercontent.com/marcops/wiles/8007ac28a89b130977b6a318708d26dd6de02abf/releases/wiles-v#{version}.zip"
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
