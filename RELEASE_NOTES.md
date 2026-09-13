# Release Notes

## Upcoming (0.4.8)

### Refinements:
- **Trash Restore Now Says "Restoring…" Instead of a Generic "Undoing…"**: Undoing a "Move to Trash" gave no sign of what it was actually doing while it restored the file, which can take a couple of seconds for a large item — it just showed the same "Undoing…" every other undo uses. It now says "Restoring…" instead.

## Version 0.4.7

### New Features:
- **Cmd+R Rename Shortcut**: You can now press Cmd+R to rename the selected file or folder, alongside the existing way of starting a rename.
- **Hover to Expand the Grid/List View Switcher**: Hovering over the view-mode switcher in the corner now expands it right there, so you can pick Grid or List without an extra click.
- **Type-Ahead Row Selection**: Typing a letter while browsing a folder now jumps to and selects the next matching row, in both Grid and List view.

### Bug Fixes:
- **Undoing "Move to Trash" Could Restore a File Under the Wrong Name**: If the Trash already had an item with the same name, undoing the move brought the file back under that collision-mangled name instead of its original one. It now always restores the original filename.
- **Go to Folder Silently Did Nothing While a Search or Smart Folder Was Open**: Cmd+L's "Go to Folder" stopped responding while a search or a Smart Folder was active. It now works in both cases.
- **Right-Clicking Inside a Multi-Selection Could Collapse It to One Item**: Right-clicking a row that was part of a multi-item selection sometimes reduced the selection down to just that row before the context menu opened, which broke Batch Rename and Merge to PDF when used on a real multi-selection. Fixed.

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

---

👉 For everything shipped before this, see [Features](FEATURES.md).

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)
