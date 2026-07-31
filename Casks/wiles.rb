cask "wiles" do
  version "0.0.9"
  sha256 "71830ef1970f19b8cb23ffe69b456f65c903ae68764b049aeedf2c672087ba74"

  url "https://raw.githubusercontent.com/marcops/wiles/5f92e4ba3728039b1b428fbf547854a5231510a3/releases/wiles-v#{version}.zip"
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
