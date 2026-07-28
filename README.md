# Wiles

A fast, native macOS file manager designed for speed, bridging the best of **GNOME Files (Nautilus)** and **macOS Finder**.

![Wiles Screenshot](docs/screenshots/screenshot-1.png)

---

## ⚡️ Quick Install (Homebrew)

```bash
brew tap marcops/wiles git@github.com:marcops/wiles.git
brew install --cask wiles
```

To update anytime:
```bash
brew upgrade --cask wiles
```

---

## 🎯 Highlights

- **Ultra-Fast Native UI**: Built purely in Swift & SwiftUI with AppKit integration. Zero electron bloat.
- **Dual Navigation Modes**:
  - **macOS Finder**: `Cmd+Down` to open, `Enter` to rename, `Cmd+Up` to go up.
  - **GNOME Nautilus**: `Enter` to open, `F2` to rename, `Backspace` to go up.
- **Flexible Sidebar**: Toggle between standard Places/Favorites and a full **Directory Tree**.
- **Seamless Drag & Drop**: Native drag preview shadows, folder drop targets, and background marquee box selection.
- **Quick Look & Search**: Press `Space` for Quick Look previews, `Cmd+F` for instant in-folder search.
- **Persistent State**: Automatically restores your last visited directory, view mode (Grid/List), and sidebar preferences.

---

## 📸 Screenshots

| Grid View | List View |
| :---: | :---: |
| <img src="docs/screenshots/screenshot-2.png" width="100%"/> | <img src="docs/screenshots/screenshot-3.png" width="100%"/> |

---

## ⌨️ Shortcuts Cheatsheet

| Action | Shortcut |
| :--- | :--- |
| **Quick Look** | `Space` |
| **Open Item** | `Double Click` or `Enter` (GNOME) / `Cmd + Down` (macOS) |
| **Go Up Directory** | `Backspace` (GNOME) / `Cmd + Up` (macOS) |
| **Box Drag Select** | `Click & Drag` on empty background |
| **Multi-Select** | `Cmd + Click` or `Shift + Click` |
| **Move to Trash** | `Cmd + Delete` or `Delete` |
| **Copy / Cut / Paste** | `Cmd + C` / `Cmd + X` / `Cmd + V` |
| **In-Folder Search** | `Cmd + F` |
| **Toggle Hidden Files** | `Cmd + Shift + .` (macOS) / `Ctrl + H` (GNOME) |
| **Properties (Get Info)** | `Cmd + I` |

---

## 📄 License

MIT License.
