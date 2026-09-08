# Release Notes

## Version 0.4.6

### Refinements:
- **Grid View Fits More of Each Name on a Line**: In Grid View, the name shown under each file and folder now uses a bit more of the width on either side, so roughly three to four more letters fit on a line before the name is shortened with an ellipsis. Names stay centred under their icon, and renaming one in place still lines up the same way.

## Version 0.4.5

### Bug Fixes:
- **Grid View Rename Box Got Hidden a Few Seconds After Opening**: In Grid View, renaming a file or folder in place worked, but about three seconds in, the pop-up that shows a selected item's full name appeared on top of the rename box and covered it, so you could no longer see what you were typing. The full-name pop-up now stays out of the way while you're renaming. List View was never affected.

## Version 0.4.4

### Bug Fixes:
- **Batch Rename Window Cut Off Its Title and Buttons**: The Batch Rename dialog wasn't tall enough for its own contents, so the title and the Cancel / Apply buttons were clipped at the top and bottom edges. It's now sized to fit, and the preview list uses the extra room.
- **Some Status-Bar Text Didn't Follow a Language Change Right Away**: After you switched Wiles' language, the free-space amount in the status bar kept showing the previous language until you opened another folder. It now updates the moment you change the setting.
- **Tag Colour Names Ignored the Language You Set in Wiles**: The names of the standard colour tags — shown in the sidebar, the path-bar pill, and the right-click Tags menu — followed your Mac's system language instead of the language you chose in Wiles. They now follow Wiles' own setting, while still acting on the very same tag your Mac uses.

## Version 0.4.3

### New Features:
- **Reset Wiles to a Clean Look, or a Presentation-Ready One**: A new View menu ▸ Appearance submenu adds two one-click resets. "Default" restores every Wiles setting to how it was the very first time you opened the app. "Director View" does the same reset, then hides every sidebar section except Favorites (seeded with just Desktop, Home, Documents, and Downloads) — handy for recordings, demos, or screenshots.

### Bug Fixes:
- **Disk Usage Visualizer Could Show a File You Already Deleted**: The breakdown only refreshed when you navigated to a different folder, so deleting, pasting, or otherwise changing files in the folder it was showing left it stuck on stale data. It now updates immediately.
- **Double-Clicking a Zip Extracted It Instead of Showing What's Inside**: Double-clicking an archive now opens the same "Inspect Contents" view as the right-click menu, instead of handing it off to extract automatically.

## Version 0.4.2

### Bug Fixes:
- **Terminal Could Keep Capturing Your Keystrokes After You Clicked Elsewhere**: With the integrated terminal open, clicking a file, a sidebar item, or empty space elsewhere in the window didn't hand keyboard control back — arrow keys, Delete, and other shortcuts kept going to the terminal instead. Clicking anywhere outside it now returns keyboard control right away; clicking the terminal again gives it back.
- **Editing a Smart Folder's Search Didn't Save When You Clicked Away**: Opening a saved smart folder's search to tweak it, then clicking elsewhere, left the raw search text showing instead of collapsing back to the folder's name, and the edit wasn't saved. It now saves automatically and collapses back to the name.
- **Directory Tree's Top Entry Wasn't Aligned With Its Section Title**: The sidebar's Directory Tree section showed its first entry (your drive) slightly out of line with the section's own arrow. Fixed.

### Refinements:
- **Smart Folder Save Button's Icon Changed, Redundant Clear Button Removed**: The search bar's "save as smart folder" button now shows a save icon instead of a folder icon, and the separate "clear" button next to it was removed.

## Earlier Highlights

- **0.3.14**: Wiles reads your Mac's own tag names and colours, so tagging on both sides acts on the same tag; List View dates and times pad to two digits; the strip behind the window buttons became a soft blur so a top-scrolled sidebar row stays faintly visible.
- **0.3.13**: Every folder can now remember whether you last viewed it as a Grid or a List.
- **0.3.11**: Batch Rename gained a Regex mode alongside Find & Replace, Prefix & Suffix, and Sequence Number.

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)
