cask "wiles" do
  version "0.0.1"
  sha256 "28092067b987591c425d6a4fcc1dd58e3483212efe8a908531914d7bbc5171e3"

  url "https://github.com/marcops/wiles/releases/download/v#{version}/wiles-v#{version}.zip"
  name "Wiles"
  desc "Fast, native macOS file manager"
  homepage "https://github.com/marcops/wiles"

  app "Wiles.app"

  zap trash: [
    "~/Library/Preferences/com.stefani.wiles.plist"
  ]
end
