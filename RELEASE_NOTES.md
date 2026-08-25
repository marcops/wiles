# Release Notes

## Version 0.3.12

### Bug Fixes:
- **Traffic-Light Buttons Could Jump or Swap Places While Resizing the Window**: Dragging a window edge could occasionally make the close/minimize/zoom buttons flicker to the wrong spot before settling back. Fixed.
- **Sidebar's Folder Tree Could Get Stuck Loading Forever**: Turning on the Directory Tree sidebar section for the first time in a session could occasionally leave it spinning indefinitely instead of loading. Fixed.
- **Sidebar Rows Could Peek Out From Under the Traffic-Light Buttons**: Scrolling the sidebar all the way up could show a row's label running behind the window's close/minimize/zoom buttons. It now fades out at the top edge instead.
- **Selecting a File or Folder in Grid View Could Change How Its Name Was Shortened**: A long name's truncation could shift by a character or two the moment you selected it, instead of staying exactly the same. Fixed.
- **"Auto-Hide Sidebar" Setting's Name Was Needlessly Long**: Shortened across every supported language.

## Version 0.3.11

### New Features:
- **Batch Rename Now Supports Regex**: A new "Regex" tab in Batch Rename lets you rename using a regular expression pattern and replacement template, alongside the existing Find & Replace, Prefix & Suffix, and Sequence Number modes.

### Bug Fixes:
- **Tags Section Rows Used a Different Font Than the Rest of the Sidebar**: Fixed to match Favorites, Places, Network, and Recents.
- **Redoing an Undone Paste of a File Could Create an Empty Folder Instead**: Undoing then redoing a pasted or copy-duplicated file could silently create an empty folder in its place while the real file stayed in the Trash. Redo now correctly restores files instead of always creating a folder — and clearly tells you when a specific file creation can't be redone (Wiles doesn't keep the original content around to recreate it) instead of silently doing the wrong thing.
- **Trash Info Could Show the Wrong State With Multiple Windows Open**: The Trash size and its loading spinner were shared across every open window, so activity in one window's Trash view could affect what another window displayed. Each window now tracks its own Trash state independently.
- **Duplicate File and Folder Names Were Inconsistent**: Pasting a duplicate file could produce "photo_1.png" while creating a new file, folder, or merged PDF produced "Document 2.txt" — two different naming styles depending on how the copy was made. Now consistent everywhere, matching Finder's own "Document 2.txt" convention.
- **Disk Usage Panel Could Show Stale Data After Quickly Switching Folders**: Navigating to a new folder right after opening the disk usage panel could occasionally leave it showing the previous folder's numbers instead of updating. Fixed.
- **Error Messages and the Properties Sheet Could Appear in Every Open Window at Once**: An error from one window's action (or opening Properties on a file) could pop up identically in every other open window. Now scoped to the window where it actually happened.
- **Terminal, Preview, and Disk Usage Panels Could Open in Every Window at Once**: Toggling any of these in one window opened it in every other open window too, and the terminal even started a separate shell in each. Each window now remembers its own state independently.
- **Creating a Symbolic Link Could Silently Delete an Existing File With the Same Name**: Typing a link name that matched a file already in the folder would permanently remove that file with no warning. Wiles now warns you before that can happen.
- **Password-Protected ZIP Had No Way to Catch a Typo**: A single password field meant a typing mistake could lock you out of your own archive forever. A confirmation field now catches a mismatch before the archive is created.

### Under the Hood:
- **Continued Internal Cleanup**: Removed two unused abstraction layers left over from an earlier refactor, consolidated five near-duplicate "find a free name" implementations and three near-duplicate loading-state screens (Archive Inspector, Duplicate Cleaner, Disk Usage) into shared, single implementations, removed a hardcoded tag-color list that duplicated the app's single source of truth for tag colors, and unified the Grid and List views' shared scroll/selection/pagination scaffolding into one common implementation so the two view modes can no longer drift out of sync with each other.
- **File Operations Now Consistently Run Off the Main Thread**: Move, copy, rename, trash, and new-folder operations were previously synchronous calls that any call site had to remember to dispatch off the main thread itself — some places already did, but the responsibility was scattered. These are now properly asynchronous throughout, closing off a class of potential UI stalls during file operations.
- **App State Reorganized Into Focused Pieces**: The app's core in-memory state (file browsing, navigation, selection, preferences) is now split into separate, focused pieces instead of one large shared object — makes future bug fixes land faster and reduces the chance of one feature's change accidentally affecting another.

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
