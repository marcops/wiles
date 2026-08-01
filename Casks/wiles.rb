cask "wiles" do
  version "0.1.2"
  sha256 "3c44aff6eec80be395eefcf5fcea1489353ebf5cc9493d53417c07361b99df43"

  url "https://raw.githubusercontent.com/marcops/wiles/6350ea5b22224c0a1b0b3c1e4339ac726f8ba385/releases/wiles-v#{version}.zip"
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
