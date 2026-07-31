cask "wiles" do
  version "0.0.7"
  sha256 "08fc97949a88e44422c4c96d5f05c01dc1cb7be4f752494a6df0966b33d9aac9"

  url "https://raw.githubusercontent.com/marcops/wiles/08d37b6ab205b23aa64266ea73a7e6beaa529914/releases/wiles-v#{version}.zip"
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
