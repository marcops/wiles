cask "wiles" do
  version "0.1.1"
  sha256 "e92b1a96c32e4e2b74f0de0f5b9d833e1bafcb15584cf03da7b237b964c14133"

  url "https://raw.githubusercontent.com/marcops/wiles/55954cefce5d19e090125211df6135e6b99a985e/releases/wiles-v#{version}.zip"
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
