# Wiles

### The file manager macOS deserves.

Built from the ground up in native Swift and SwiftUI. No Electron. No wrappers. No compromises.

Every interaction is designed to feel instant, every shortcut within reach, every detail considered — a file manager built entirely on its own terms.

![Wiles Screenshot](docs/screenshots/v0.0.9-hero.png)

---

## What's New
Check out the latest features and updates in our Release Notes!
👉 **[Read the Release Notes](RELEASE_NOTES.md)**

---

## ⚡️ Quick Install (Homebrew & Direct DMG)

### Option 1: Direct DMG Download (GUI)
Download the **[Latest Release DMG](https://github.com/marcops/wiles/releases/latest)**, open it, and drag `Wiles.app` to `/Applications`.

### Option 2: Homebrew Cask Terminal
```bash
brew tap marcops/wiles git@github.com:marcops/wiles.git
brew install --cask wiles
```

> **Note**: Since Wiles is self-compiled (un-notarized by Apple), macOS Gatekeeper may block it on first open.
>
> To unlock the app on first launch, run:
> ```bash
> xattr -cr /Applications/Wiles.app
> ```
> Or Right-Click **Wiles.app** in Finder and choose **Open**.

To update anytime:
```bash
brew upgrade --cask wiles
```

---

## Meet Wiles

**Instant, by design.**
Wiles opens the moment you click it — no splash screen, no spinner, no waiting around. Every interaction, from opening a folder of thousands of files to zooming your icon grid, is built to feel immediate.

**Two ways to move. Both fully yours.**
Prefer modifier keys? `Cmd+Down` opens, `Return` renames, `Cmd+Up` goes up. Prefer single-key speed? `Enter` opens, `F2` renames, `Backspace` goes up. Wiles adapts to how you move — switch anytime in Preferences.

**See where your space went.**
Hit `Cmd+Shift+D` and watch a visual, proportional breakdown of your biggest files and folders appear — instantly, with nothing to install and nothing to wait for.

**Rename one file or five thousand.**
A live before/after preview shows you exactly what's about to happen — find & replace, prefixes and suffixes, sequential numbering — before you commit to anything.

**Convert and crop, right where you are.**
Drag-select a crop, resize to an exact pixel count, or flip between JPEG, PNG, HEIC, and TIFF — without ever leaving the file list.

**Compression that doesn't get in your way.**
Zip and unzip run asynchronously on Apple's own native tooling, so a large archive never freezes your window.

**Browse it your way.**
Stick with familiar Places and Favorites, or open a full Directory Tree and see your entire filesystem laid out at once.

**Sweated over, down to the pixel.**
Real drag previews with shadows, folders that light up as valid drop targets, marquee box selection, Quick Look on `Space`, instant search on `Cmd+F` — the details that make a file manager feel like it belongs on your Mac.

**Fluent in five languages.**
English, Portuguese, Spanish, French, and German, detected automatically from your system language — switchable anytime.

---

## ⚙️ Under the Hood

**100% native. Zero bloat.**
Every pixel is Swift and SwiftUI, with AppKit where it counts. No Electron, no Chromium, no cross-platform framework tax — just a small, fast binary that behaves like a first-class macOS citizen.

### Shortcuts Cheatsheet

| Action | Shortcut |
| :--- | :--- |
| **Quick Look** | `Space` |
| **Open Item** | `Double Click` or `Enter` (Quick) / `Cmd + Down` (Classic) |
| **Rename Item(s)** | `F2` (Quick) / `Return` (Classic) |
| **Go Up Directory** | `Backspace` (Quick) / `Cmd + Up` (Classic) |
| **Disk Usage Visualizer** | `Cmd + Shift + D` |
| **Focus Path Bar** | `Cmd + L` |
| **In-Folder Search** | `Cmd + F` |
| **Move to Trash** | `Cmd + Delete` or `Delete` |
| **Copy / Cut / Paste** | `Cmd + C` / `Cmd + X` / `Cmd + V` |
| **Toggle Hidden Files** | `Cmd + Shift + .` (Classic) / `Ctrl + H` (Quick) |
| **Properties (Get Info)** | `Cmd + I` |

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

Please submit all bug reports and feature proposals directly via **GitHub Issues**:
- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)

---

## 📄 License

MIT License.
