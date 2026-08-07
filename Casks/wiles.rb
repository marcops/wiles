cask "wiles" do
  version "0.2.2"
  sha256 "98e1ef760c3a790d3de9d628360533227bd480ccf94d25c96762f832c9cc46f0"

  url "https://raw.githubusercontent.com/marcops/wiles/1f008fb3ee02216f67af68e57b9873ec9f96acd6/releases/wiles-v#{version}.zip"
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
