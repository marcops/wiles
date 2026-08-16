# Release Notes

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

## Version 0.3.2
**Rename & Keyboard Reliability Release**

### Bug Fixes:
- **Renaming Didn't Save on Return**: Pressing Return, or the numeric-keypad Enter key, after typing a new name sometimes did nothing at all — the new name was never saved. Fixed.
- **Keyboard Could Stop Responding After Dragging a File to Another App**: Dragging a file out of Wiles into another app (e.g. an attachment into a chat app) could leave the keyboard completely unresponsive everywhere in Wiles until you relaunched it. Fixed.

---

## Version 0.3.1
**Reliability & Safety Release**

### Bug Fixes:
- **Creating a Symlink Could Delete Your Original File**: If a symlink's destination happened to match its source, Wiles used to delete the source file while trying to create the link — a real data-loss risk. Fixed.
- **Extracting an Archive Over an Existing File**: Extracting an archive entry into a spot that already had a file is now done safely, instead of a step that could leave you with a corrupted or missing file if extraction failed partway through.
- **Silent Failures in Shred, Smart Folders, and Batch Rename**: These actions used to fail quietly with no explanation if something went wrong. They now show a clear error so you know what happened.
- **Invalid Batch Rename Patterns Failed Silently**: Typing a broken search pattern into Batch Rename used to just do nothing. It now tells you the pattern is invalid.
- **Favorites Pointing to the Wrong Folder After a Move**: Moving a folder that was also saved as a Favorite could leave the Favorite pointing at its old location. Fixed.
- **Renaming Could Get Stuck**: Navigating away or changing your selection while renaming an item in place could leave it stuck in edit mode. Fixed.

### Refinements:
- **Better VoiceOver Support**: Added missing accessibility labels to the Wi-Fi Sharing and Archive Inspection windows.
- **Smoother "Whole Mac" Search in Column View**: Fixed a minor animation glitch that could occur when a lot of search results loaded at once in Column view.

---

## Version 0.2.2
**Stability & Security Hardening Release**

### Security Fixes:
- **Terminal Could Be Tricked by a Folder Name**: A folder with a specially crafted name could trick the built-in Terminal into running commands you never asked for, the moment you opened it. Fixed — folder names are now always handled safely, no matter what characters they contain.
- **Smart Folder Search Crash**: Certain special characters typed into a search could crash the app or corrupt a Smart Folder. Fixed.

### Bug Fixes:
- **Undo/Redo Reliability**: A failed undo (e.g. the file was already moved or deleted outside the app) used to fail silently and could corrupt the redo history. Undo/Redo failures now surface a clear error and never corrupt history.
- **Duplicate Cleaner No Longer Hangs on Cancel**: Closing the Duplicate Finder mid-scan now stops the scan immediately instead of continuing in the background.
- **Wi-Fi Folder Sharing Stability**: Fixed a rare crash risk when starting/stopping Wi-Fi folder sharing while a file was still transferring.
- **File Column View Stale Content**: Rapidly navigating between folders in Column View could briefly show a previous folder's contents. Fixed.
- **Auto-Organization No Longer Freezes the Window**: Rules that move large files (especially to an external drive) now run fully in the background instead of freezing the app while they work.
- **Smart Folders Duplicating Results**: Repeated Smart Folder searches over a long session used to start showing duplicate results. Fixed.

### Performance:
- **Faster, Lighter Everywhere**: Image previews, PDF page counts, file properties, and folder listings are all noticeably snappier now — especially in large folders and on slow or networked drives.
- **Bounded Memory Over Long Sessions**: Navigation history, expanded-folder state, and file tooltips no longer keep growing the longer you leave Wiles open — memory use now stays capped.
- **Smoother Column Resizing**: Dragging a column border to resize it feels smoother now — your layout is saved once you let go, not on every tiny movement.

---

## Version 0.2.1
**Navigation, Selection & Stability Release**

### Bug Fixes:
- **Grid View Arrow-Key Navigation**: Up/Down arrows in Grid View were moving the selection sideways instead of vertically. Fixed.
- **Selection Lost When Navigating Up**: Going back to a parent folder (or pressing Up) no longer resets selection to the first item — it now restores selection to the child folder you just came from, matching Finder.
- **List/Column Views No Longer Auto-Select on Open**: Entering a folder in List or Column view used to auto-select the first item; now nothing is selected until you press an arrow key, and the first press selects the right item in the right direction.
- **Cmd+Z (Undo) Was Silently Broken**: A leftover system "Undo" menu item was intercepting the Cmd+Z shortcut before Wiles ever saw it. Undo/Redo now work reliably.
- **Periodic Flicker in the File List**: The file list was quietly redrawing itself in the background every so often even when nothing had changed. Fixed — it now only redraws when content genuinely changes.
- **Mouse Drag-Selection Fixed**: Drag-selecting a box of items (marquee selection) in Grid/List views wasn't reliably catching everything inside the box. Fixed.
- **Search Toggle Button**: Clicking the search icon a second time to close search sometimes reopened it instead. It's reliable now.
- **Terminal Drawer Crash on Fast Open/Close**: Rapidly toggling the integrated terminal open and closed could crash the app. Fixed — the terminal session now stays alive in the background, and open/close animates as a smooth slide instead.
- **Folder Icon During Drag-and-Drop**: Dragging a file over a folder and holding now swaps the folder's icon to the system's "open folder" icon before it spring-loads open, matching Finder.

### Refinements:
- **Instant Folder Re-Visits**: Revisiting a folder you've already opened shows its contents instantly instead of flashing empty while it reloads.
- **Restored Smooth Loading for Large Folders**: Folders with more than 500 items load in smoothly again instead of trying to show everything at once.
- **Thumbnails Generated Once**: Image/video/PDF thumbnails are now generated a single time at a fixed high resolution and reused — zooming the icon size in Grid View no longer regenerates them.
- **In-Place Name Expansion**: Selecting a file with a long, truncated name and pausing on it briefly now expands the name in place to show it in full, instead of staying truncated with "…".
- **Richer File Tooltip**: Hovering an item now shows a short delay before a tooltip with name, kind, size, dates, and (for images/PDFs) dimensions or page count.
- **Shorter Date Format**: File dates in List View now use your system's short date/time style instead of a long fixed format, so they no longer overflow the column.

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
