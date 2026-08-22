# Release Notes

## Version 0.3.11 (Upcoming)

### Bug Fixes:
- **Tags Section Rows Used a Different Font Than the Rest of the Sidebar**: Fixed to match Favorites, Places, Network, and Recents.

---

## Version 0.3.10
**Accessibility & Translation Release**

### New Features:
- **Paste Now Creates a File From Copied Text or Images**: If you copy a screenshot or some text and paste into a folder with nothing else copied, Wiles now creates a new file from it instead of doing nothing — an image, or a text file.
- **Sidebar Auto-Hide**: A new Advanced setting (also in the View menu) collapses the sidebar into a slim icon-only rail; hover over it to bring it back to full width.

### Refinements:
- **Better VoiceOver Support**: Several dialogs and sidebar rows — including Duplicate Cleaner, File Properties, archive password entry, symlink creation, and the feedback form — now announce themselves properly to VoiceOver. Extended to more controls across the footer, header search/filter buttons, and the sidebar folder tree's expand/collapse arrow.
- **More Consistent Translations**: A number of screens that showed English text regardless of your language setting — including item counts, error messages, photo details, and keyboard shortcut hints — are now fully translated into every supported language.
- **New Keyboard Shortcuts**: "New File" (⌘⌥N) and "Move to Trash" (Delete) now show their shortcuts in the File menu.

### Bug Fixes:
- **Trash Badge Could Misreport as Empty in Some Languages**: The sidebar's "empty trash" indicator relied on matching specific English text and could show incorrectly outside English. Fixed.
- **Copy/Paste/Select All Didn't Work While Typing a Path**: Using those shortcuts while editing the path bar acted on the selected files instead of the text you were typing, the same bug already fixed for the rename field. Fixed.
- **Could Freeze When Launching or Browsing With a Sleeping Network Drive**: Recently-opened folders, favorites, or the current folder living on an unreachable network share could stall the whole app at launch or while browsing. Fixed.
- **Preview Panel Looked Too Bright in Light Mode**: Its translucent background wasn't dimming correctly in Light appearance. Fixed.
- **Help Screen's Sidebar Section Showed the Wrong Description**: Fixed.
- **Sidebar's Folder Tree Could Grow Memory Use Over a Long Session**: Browsing many folders in the sidebar's tree view without restarting the app is now capped instead of growing indefinitely.
- **Moving a File Over an Existing One Could Lose Data if the Move Failed Partway**: The old file was deleted before the move was confirmed to succeed. Now the replace happens atomically. Fixed.
- **"Connect to Server" Could Fail Silently**: An invalid or unreachable address now shows an error instead of doing nothing.
- **Sidebar Folder Tree's Right-Click Highlight Could Stay on Two Folders at Once**: Fixed.
- **Inline File Preview Could Crash the App Under Memory Pressure**: Now shows an "unavailable" placeholder instead.
- **Sidebar Could Stay Visible With Every Section Turned Off**: It now hides entirely instead of showing an empty panel.
- **Sidebar's Scrollbars Could Appear or Size Themselves Incorrectly**: Sidebar rows now truncate long names instead of needing to scroll sideways, and the vertical scrollbar no longer miscalculates its size.
- **Sidebar's Folder Tree Could Get Stuck Loading Forever**: A folder structure that looped back on itself (e.g. a volume mounted inside itself) could leave the tree spinning indefinitely. Fixed, with a safety timeout so it can no longer hang regardless of cause.
- **Folder Tree and Tags Rows Didn't Highlight on Hover**: Now match the rest of the sidebar (Favorites, Places, Network, Recents).
- **Undo/Redo and the Integrated Terminal Could Leak Between Windows**: An undo or terminal session in one window could affect another open window instead of staying independent. Fixed.
- **Failed Clipboard-to-File Paste Now Shows an Error**: Previously failed silently with no feedback.

### Under the Hood:
- **More Reliable Local Network Sharing and Auto-Organization**: Fixed two rare timing bugs that could occasionally cause a crash while sharing files over your local network or while Auto-Organization was watching a folder. A further rare timing bug in local sharing — which could occasionally use the wrong shared folder or password under load — is also fixed.
- **Large Parts of the App Reorganized Internally**: The menu bar, sidebar, keyboard shortcuts, and folder auto-organization code were each split into smaller, focused pieces with no change in behavior — makes future bug fixes and features land faster and with less risk of side effects elsewhere in the app. Continued with the app's core state management, several dead code paths, and a handful of duplicated code blocks.

---

## Version 0.3.9
**Sidebar & Path Bar Fix Release**

### New Features:
- **New Setting: Always Show Full Path Bar**: An Advanced setting that keeps the full folder path always visible in the header, instead of only showing it while hovering.

### Bug Fixes:
- **Could Crash Right After Launch**: A background error-reporting step could crash the app on startup in some cases. Fixed.
- **Sidebar Folder Tree Couldn't Be Expanded Past Your Home Folder**: Folders outside your home folder's path showed no expand arrow at all, so there was no way to browse into them from the tree. Fixed, and expanding a folder with several previously-opened subfolders no longer freezes the app.
- **Sidebar Folder Tree Indentation Grew Incorrectly**: Each nested level shifted further right than it should have. Now indents by a consistent amount per level, and a long folder name or a deeply nested tree scrolls horizontally instead of getting clipped or wrapped.
- **Sidebar Could Appear Vertically Centered Instead of Anchored to the Top**: Fixed.
- **Path Bar Didn't Expand While Dragging a File Over It**: Dragging a file onto the path bar now shows the full path so you can drop it into any folder along the way, matching how it already worked on hover.
- **Path Bar Could Show the Start of a Long Path Instead of Your Current Folder**: When showing the full path, it now keeps your current folder in view.

---

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

## Earlier Highlights

Full detail only sticks around for the 5 most recent versions — everything older collapses here, down to just the features that mattered:

- **Column view matches List/Grid, New File menu item** *(0.3.3)*: Multi-select and right-click now work the same way in Column view as everywhere else, and a "New File" menu item joins "New Folder".
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
