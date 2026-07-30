cask "wiles" do
  version "0.0.5"
  sha256 "b73babd6edd4bee9ead59d26b082a0b2aff0f96dc3eae07d6f347159bec4250a"

  url "https://raw.githubusercontent.com/marcops/wiles/9f85a5f6d0b1926ef6eaafcc214688a8916594b5/releases/wiles-v#{version}.zip"
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
