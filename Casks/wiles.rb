cask "wiles" do
  version "0.0.3"
  sha256 "055df219bf49702988fd96b1f98691b13a182f2fbdaba2e81e19d0a1834a6e51"

  url "https://raw.githubusercontent.com/marcops/wiles-source/main/dist/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager"
  homepage "https://github.com/marcops/wiles-source"

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
