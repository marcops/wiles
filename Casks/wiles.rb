cask "wiles" do
  version "0.1.0"
  sha256 "a7df222c7779b2a97affc6a28da0ad844dfadace4d4f09c8e3602265f6e46594"

  url "https://raw.githubusercontent.com/marcops/wiles/2b547c7312ec2921b6b2bc918a128dacbd375020/releases/wiles-v#{version}.zip"
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
