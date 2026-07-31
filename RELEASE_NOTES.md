# Release Notes

## Version 0.0.9
**UX Polish, Unified Locales & List Column Optimization Release**

### Improvements:
- **Unified Localized Mode Titles**: Standardized sidebar mode titles (`Places & Devices` / `Directory Tree`) across menu bar pickers and section headers in English, Portuguese, Spanish, French, and German.
- **View Switcher Button Styling**: Fixed collapsed button styling in `HeaderBarView` so the view switcher button reverts to neutral background styling when collapsed.
- **List Column Defaults & Last Column Resizing**: Updated default visible list columns to Name, Size, and Date Modified (hiding Kind by default), and enabled interactive column resize handles on all visible columns including the last column.
- **Zero Startup Permission Dialogs**: Eliminated proactive background directory probing on startup to ensure Wiles launches immediately without permission prompts, adding a direct "Grant Full Disk Access..." menu item.

---

## Version 0.0.8
**Permission Management & Startup Optimization Release**

### Improvements:
- **Single-Batch Initial Permissions**: Grouped all standard user folder permission requests (`Desktop`, `Documents`, `Downloads`, `Music`, `Pictures`, `Movies`) into a single batch on initial app launch.
- **Zero Startup Interruptions**: Implemented `UserDefaults` persistence (`wiles_hasRequestedInitialPermissions`) to ensure initial permission logic runs strictly once on first launch and never again on subsequent app starts.
- **Automated Test Coverage**: Added dedicated `PermissionTests` suite verifying initial state execution, persistence guardrails, and return behavior.

---

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
