cask "wiles" do
  version "0.0.6"
  sha256 "b738758d2910872c521578ee2d1f7dfa4fe3c6f1b30c76ffe924414d23eeb2bf"

  url "https://raw.githubusercontent.com/marcops/wiles/d537e94c53d280e95404383f5366e0ef8aae91fd/releases/wiles-v#{version}.zip"
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
