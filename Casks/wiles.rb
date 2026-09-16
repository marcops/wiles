cask "wiles" do
  version "0.4.9"
  sha256 "84939d8e274bb36b861efc98ab3ef321b64a975dd5be3a578b07dce7529817a6"

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
