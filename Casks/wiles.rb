cask "wiles" do
  version "0.0.2"
  sha256 "dff91fdc48bf0d1b3df2ee9414b95aca2d16f23ed0f7af5bbb0216ba154b189c"

  url "https://raw.githubusercontent.com/marcops/wiles/main/releases/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager inspired by Nautilus & Windows Explorer"
  homepage "https://github.com/marcops/wiles"

  depends_on macos: ">= :sonoma"

  app "Wiles.app"

  zap trash: [
    "~/Library/Preferences/com.wiles.app.plist",
    "~/Library/Saved Application State/com.wiles.app.savedState",
  ]
end
