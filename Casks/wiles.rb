cask "wiles" do
  version "0.3.3"
  sha256 "50f093ac9fcfc47bb8bece08e21aed2cd337d3417256029a34dbdc19169690ba"

  url "https://github.com/marcops/wiles/releases/download/v#{version}/wiles-v#{version}.zip"
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
    "~/Library/Preferences/com.marco.wiles.plist",
    "~/Library/Saved Application State/com.marco.wiles.savedState",
    "~/Library/Caches/Wiles",
  ]
end
