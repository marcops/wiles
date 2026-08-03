# Release Notes

## Version 0.1.2
**Performance, Lazy Loading, and Premium HUD Release**

### New Features:
- **Unified Lazy Loading**: Enhanced performance across grid, list, and column views by loading items in optimized chunks of 5,000 items.
- **Shortcuts Cheatsheet HUD**: A beautiful, glassmorphic HUD panel (triggered via `Cmd + /` or the Tools menu) displaying contextual shortcuts matching your active navigation mode (macOS vs Gnome).
- **Standalone Recents Item**: Added a dedicated, standalone Recents sidebar item pointing to a virtual view displaying the top 50 recently accessed items.
- **Trash Space Indicator & Confirmation**: View real-time disk space consumed by the Trash in the sidebar, with asynchronous loading indicators and a clean confirmation sheet before emptying.
- **Drag-and-Drop Sidebar Hover Highlights**: Visual spring-animated scaling and accent highlights on sidebar items when dragging files over them.

### Refinements:
- Decoupled "Show Recents" settings from the MAC section toggle.
- Full localization (AR, DE, ES, FR, PT, EN) for all new components.
- Native layout-aware custom mapping for keyboard shortcuts to prevent layout remapping issues.

---



## Version 0.1.1
**Transparency Menu & Right-Click Menu Cleanup Release**

### New Features:
- **Unified Transparency Menu**: Sidebar and Content translucency pickers are
  now grouped under a single App > Transparency menu instead of two separate
  top-level entries.

### Bug Fixes:
- **Select All (Cmd+A)**: Fixed a shortcut conflict where the system's
  default (inactive) Select All menu item silently absorbed `Cmd+A` before
  it could reach the app's own handler, so selecting all items never worked.
- **Deprecated Share API**: Replaced a deprecated `NSSharingService`
  enumeration (flagged by the OS as unavailable since macOS 13) with the
  native SwiftUI `ShareLink` in the file context menu.

### UI Refinements:
- Removed "Sort By", "View Mode", "Show Hidden Files", and "Refresh" from
  the background right-click menu, leaving only the actions specific to
  that context.
- Grid View icons are now larger and use more of the available card space.
- Restored the large photo icon next to the footer's icon-size slider.

---



## Version 0.1.0
**Menu Bar Overhaul, Appearance Themes & Real Thumbnail Previews Release**

### New Features:
- **Restructured Menu Bar**: Split the single sprawling menu into proper native
  App, File, Edit, View, Go, Tools, and Help menus, matching macOS conventions.
- **Appearance Theme Picker**: Choose System, Light, or Dark appearance from
  the App menu, independent of the macOS system-wide setting.
- **Sort By Menu**: New View > Sort By submenu (Name, Size, Date Modified,
  Kind) with an ascending/descending toggle.
- **Undo / Redo**: File operations (move, rename, delete, etc.) can now be
  undone and redone from the Edit menu or `Cmd+Z` / `Cmd+Shift+Z`.
- **Real Image Thumbnails in Grid View**: Image files now show an actual
  rendered thumbnail instead of a generic file icon, loaded asynchronously
  and cached.
- **Quick Look & Open from the File Menu**: Added dedicated File > Open and
  File > Quick Look menu items alongside their existing shortcuts.

### Bug Fixes:
- **Sidebar Double-Click to Zoom**: Double-clicking the empty space at the
  top of the sidebar (next to the native traffic-light buttons) now
  reliably zooms/restores the window; it previously did nothing because the
  scrollable sidebar list was swallowing the click before it reached the
  zoom gesture.
- **Path Bar Breadcrumb Scrolling**: Hovering a long breadcrumb path now
  reliably scrolls to reveal the end of the path. The scroll used to
  silently fail because each segment was assigned a new random identifier
  on every redraw, so the app could never find the segment it was trying
  to scroll to.
- **Auto-Hiding Grid Scrollbars**: Grid View scrollbars now auto-hide like
  every other native AppKit scroll view instead of staying permanently
  visible.
- Initial permission request dialogs are now shown in the user's selected
  app language instead of always in English.

---



## Version 0.0.10
**Keyboard Arrow Navigation & List View Scroll Fix Release**

### New Features:
- **Arrow Key Navigation**: Full keyboard navigation is now supported in both Grid View and List View:
  - `↑` / `↓` — Move selection up and down through files and folders.
  - `←` — Navigate to the parent directory (List View) / move selection left by one column (Grid View).
  - `→` — Enter the selected folder (List View) / move selection right by one column (Grid View).
  - `⇧ + ↑ / ↓` — Extend the current selection range (multi-select with keyboard).

### Bug Fixes:
- **List View Horizontal Scroll**: The horizontal scrollbar no longer appears persistently when columns fit the window. It now only becomes visible when column widths genuinely exceed the available view width.
- **List View Vertical Whitespace**: Eliminated excessive blank space at the bottom of the List View caused by a hardcoded 600pt minimum height on the scroll content. The vertical scroll area now tracks actual content height accurately.
- **UserDefaults View Mode Restore**: Fixed an edge case where a late `UserDefaults` write during `AppState` initialization could overwrite the persisted `viewMode`, causing the app to always restart in Grid View regardless of the user's last preference.

### Quality & Testing:
- **8 new automated tests** added in `ArrowKeyNavigationTests`:
  - `↓` moves selection to next item
  - `↑` moves selection to previous item
  - Boundary clamping: `↓` at last item stays on last item; `↑` at first item stays on first item
  - Empty-selection start: `↓` with no prior selection selects the first item
  - `Shift+↓` extends range selection correctly
  - `→` navigates into the selected directory in List View
  - `←` invokes `goUp()` to navigate to the parent directory
  - Default columns (Name, Size, Date Modified) verified
- **Full test suite: 80 Passed, 0 Failed** (`swift run Wiles --test`)

---



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
