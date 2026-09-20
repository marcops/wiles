cask "wiles" do
  version "0.4.11"
  sha256 "f027bcd9fbe5a94969ddcb998f520a736b0dce123bf3724c8f1f5e78346ee1cc"

  url "https://github.com/marcops/wiles/releases/download/v#{version}/wiles-v#{version}.zip"
  name "Wiles"
  desc "Ultra-fast modern macOS File Manager"
  homepage "https://github.com/marcops/wiles"

  depends_on macos: :sonoma

  app "Wiles.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Wiles.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.marco.wiles.plist",
    "~/Library/Saved Application State/com.marco.wiles.savedState",
    "~/Library/Caches/Wiles",
  ]
end
