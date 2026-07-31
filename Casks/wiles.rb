cask "wiles" do
  version "0.0.10"
  sha256 "f8a7dcd1c57f0590c347fb2f5f44ee3a452371c877a3844dc42ef4ada19ff240"

  url "https://raw.githubusercontent.com/marcops/wiles/29b0c3e50237893a93f65985af2838bbc078058f/releases/wiles-v#{version}.zip"
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
