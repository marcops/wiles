# Release Notes

## Version 0.0.7
**UI Testing Architecture & Sandboxed Paths Release**

### Improvements:
- **UI Testing Sandboxed Paths**: Migrated all automated UI test temporary workspaces to system `NSTemporaryDirectory()` for complete path portability and clean host isolation.
- **Bundle & Asset Optimization**: Rebuilt native app bundle with complete resource bundle structures (`Wiles_Wiles.bundle`), updated app versioning (0.0.7), and validated asset resources.
- **XCUITest Focus & Stability**: Enhanced UI test input focus handling and automated `--ui-testing` environment flags across search, navigation, and file operations test suites.

---

## Version 0.0.6
**Network, Security & Quality Assurance Release**

### New Features:
- **Wi-Fi Folder Sharing**: Instantly share any folder over your local network via a built-in HTTP server (no third-party apps required). Access shared folders from any browser on the same Wi-Fi. Copy the URL with one click.
- **Bonjour Network Discovery**: Automatically discovers SMB/AFP shares and Bonjour services on your local network. New collapsible **NETWORK & CLOUD** section in the sidebar (toggle via View menu).
- **Folder Auto-Organization**: Define rules to automatically route files to target folders by extension (e.g., all `.pdf` → `~/Documents/PDFs`). Rules are persisted and run in the background.
- **Network & Cloud Toggle**: Show/hide the Network & Cloud sidebar section via View → Show Network & Cloud (off by default for a clean UI).

### Quality & Testing:
- **Comprehensive Automated Test Suite**: 50 automated tests across 15 modular test suites covering every core subsystem:
  - Navigation, Favorites, UI/PathBar, UI/ContextMenu, UI/ViewMode, Localization
  - FileSystem, ZipArchive, BatchRename, FileShredder, SymlinkService, UndoRedo
  - LocalHttpServer (including path traversal security blocking)
  - AutoOrganization, NewFileTemplate, DiskSpaceVisualizer, ImageConverter, NetworkDiscovery
- **Security Fix**: HTTP folder sharing now blocks directory traversal attacks (`/../etc/passwd` → 403 Forbidden).
- **Archive Fix**: ZIP extraction now correctly detects and throws errors on corrupt/invalid archives.
- Run the full test suite with: `swift run Wiles --test`

### Improvements:
- Help sheet updated with Wi-Fi Folder Sharing and Auto-Organization documentation.
- All new features fully localized in English, Portuguese, Spanish, French, and German.

---


## Version 0.0.5
**First Major Public Release**

Wiles is a fast, native macOS file manager designed for speed, bridging the best of GNOME Files (Nautilus) and macOS Finder. 

### Highlights:
- **Ultra-Fast Native UI**: Built purely in Swift & SwiftUI with AppKit integration. Zero electron bloat.
- **Dual Navigation Modes**: Classic macOS Finder shortcuts or GNOME Nautilus styles.
- **Folder Disk Usage Visualizer**: Visual breakdown of top 10 largest files/subfolders with colored proportional bars.
- **Single & Batch File Renamer**: Powerful renaming with live before/after previews (Find & Replace, Prefix/Suffix, Sequence Numbering).
- **Native Image Converter & Crop**: Quick format conversion (JPEG, PNG, HEIC, TIFF), aspect ratio cropping, and exact pixel resizer.
- **Native ZIP Compression**: Built-in async compression & extraction.
- **Seamless Drag & Drop**: Native drag preview shadows, folder drop targets.
- **Right Preview Sidebar**: View rich metadata, image dimensions, and media durations dynamically (Toggleable via View Menu).
- **Modern Properties Window**: Advanced file properties showing UNIX permissions, ownership, and deep system metadata (Cmd+I).
