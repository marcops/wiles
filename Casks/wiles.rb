cask "wiles" do
  version "0.0.4"
  sha256 "922591f2ba7e4d3eca9a266e634b260410888bd42858644a93bc867da9638fe9"

  url "https://raw.githubusercontent.com/marcops/wiles/d36aa172333c2f5e1ab7e37f02cc1bc58df5c6a8/releases/wiles-v#{version}.zip"
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
