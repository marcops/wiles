# Release Notes

## Version 0.3.7
**Dialog Consistency Release**

### Bug Fixes:
- **Duplicate Cleaner's Confirm Button Was Undersized**: It rendered noticeably smaller than the equivalent button in every other dialog in the app. Fixed to match.

### Refinements:
- **Every Dialog Now Looks and Behaves the Same**: Settings, Help, Duplicate Cleaner, and every other dialog window in Wiles now share the exact same header, background, and button layout — no more dialogs that felt slightly different from each other.
- **Shorter Duplicate Cleaner Button**: Its confirm button now reads "Move to Trash" instead of a much longer label.
- **"About" Menu Item Now Reads "About Wiles"**: Matches the standard macOS convention.

---

## Version 0.3.6
**Folder Picker Overhaul**

### Refinements:
- **Choose Folder Now Shows Your Favorites and Browses Fully**: The folder picker used in Auto-Organization Rules now shows your actual sidebar Favorites (hidden if you don't have any saved), and its folder tree can now be expanded all the way down instead of stopping after one level.
- **Type or Click to Pick a Folder**: The folder path now sits at the top of the picker and can be typed directly — Wiles checks it's a real folder before accepting it — or set by clicking through the tree, which scrolls to keep your selection in view.
- **Folders Without Subfolders No Longer Show a Misleading Expand Arrow**.
- **Tidier Add Rule Row**: The folder buttons in "Add New Rule" are wider and left-align long names instead of centering and truncating them awkwardly, and the extension field is now sized for what people actually type.

---

## Version 0.3.5
**Search Bar Fix Release**

### Bug Fixes:
- **Search Field Was Too Narrow**: The search box in the header didn't expand to use the available space, making it harder to see what you typed. Fixed.

---

## Version 0.3.4
**Archive Extraction Reliability Release**

### Bug Fixes:
- **Extracting a File From an Archive to an External Drive or Network Location Could Fail**: Pulling a single file out of a Zip (or similar archive) via the archive inspector could silently fail when the destination was on an external drive, network share, or other separate volume. Fixed.

---

## Version 0.3.3
**Column View Reliability Release**

### New Features:
- **Column View Now Matches List and Grid**: Multi-select and right-click now work the same way in Column view as they already did everywhere else.
- **New File Menu Item**: The File menu had "New Folder" but no "New File" — added.

### Bug Fixes:
- **Shift+Arrow Selection Could Select the Wrong Files**: Extending a selection with Shift+Arrow sometimes jumped from the wrong starting point. It now anchors correctly, including in Column view, and the window scrolls to follow your selection.
- **New Folder/File in Column View Could Land in the Wrong Column**: Creating a new item in Column view could appear in a different column than the one you right-clicked, or lose its rename box if the folder happened to refresh at the same moment. Fixed.
- **Cut/Copy/Paste/Select All Could Break While Renaming**: These shortcuts could stop working correctly while a rename box was open. Fixed.
- **New Folder/New File No Longer Use a Popup Dialog**: Both now create the item instantly and let you type its name right there, instead of interrupting you with a dialog box.

---

## Earlier Highlights

Full detail only sticks around for the 5 most recent versions — everything older collapses here, down to just the features that mattered:

- **Rename directly in place, "Whole Mac" search & Finder-style truncation** *(0.3.0)*: Renaming edits the name right where it sits, a new search toggle searches your whole home folder recursively, and long file names truncate in the middle like Finder.
- **Faster large folders & shortcuts cheatsheet** *(0.1.3)*: Grid, List, and Column views load big folders in smooth batches; a quick-reference shortcuts panel, a standalone Recents item, and a Trash space indicator were added too.
- **Transparency controls** *(0.1.1)*: Sidebar and window transparency, adjustable from one place in the menu bar.
- **Menu bar overhaul & appearance themes** *(0.1.0)*: Proper native menus, a Light/Dark/System appearance picker independent of your Mac's setting, real image thumbnails in Grid view, and Undo/Redo for file operations.
- **Full keyboard navigation** *(0.0.10)*: Move around and select files entirely from the arrow keys, no mouse required.
- **Wi-Fi folder sharing & network discovery** *(0.0.6)*: Share any folder over your Wi-Fi network in one click and open it from a browser on another device; shared folders on your network are discovered automatically. Plus auto-organization rules that sort incoming files into folders by type.
- **First release** *(0.0.5)*: Wiles launched with a fast, native file browser, a disk usage visualizer, batch renaming with live previews, built-in image conversion and cropping, and native Zip support.

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)
