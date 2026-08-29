# Release Notes

## Version 0.3.15

### Refinements:
- **Moving a File Onto One With the Same Name Now Asks What to Do**: Instead of quietly replacing the existing file, Wiles shows a Replace / Keep Both / Cancel choice (with an "apply to all" option for a batch). "Replace" sends the old file to the Trash rather than destroying it.
- **Search Is Smoother While Typing**: The file list waits a fraction of a second after your last keystroke before refreshing, instead of re-running on every letter — noticeably less flicker, especially with "search everywhere" on.
- **Permanent Delete Now Asks First**: "Delete Immediately" (which skips the Trash and can't be undone) shows a confirmation, matching "Move to Trash". You can still turn confirmations off in Advanced Settings.
- **"Secure Shred" Removed**: It promised to overwrite a file's data before deleting, which modern (SSD) drives don't let any app actually guarantee. Regular permanent delete and Move to Trash are unchanged.
- **New Files and Folders Appear in the Right Place**: A newly created item slots straight into its correct sorted position in the list, instead of appearing at the top and then jumping.
- **Applying Permissions to a Whole Folder Shows Progress**: A recursive permission change now shows progress and a summary of what changed.
- **A Few More Screens Fully Translated**: Some error messages that still fell back to English now follow your language setting.

### Bug Fixes:
- **Undoing a Folder Move Could Break a Favorite**: Moving a folder you'd added to Favorites (or one containing a Favorite) and then pressing Undo left the Favorite pointing at the now-empty new location. Undo and Redo now keep Favorites in sync.
- **The Cancel Button on a Running Copy or Delete Didn't Cancel**: Pressing ✕ on an in-progress file operation only hid the progress bar — the work kept running. It now actually stops.
- **Very Large ZIP Files Showed as Empty**: A ZIP over 4 GB (or with a very large number of entries) listed nothing in the Archive Inspector. Its contents now show correctly.
- **ZIP Entries With Unusual Names**: Files named like "report[1].txt", and files from ZIPs made on Windows with non-English names, could be listed or extracted incorrectly, or skipped entirely. Fixed.
- **Smart Folder Search Could Spin Forever on a Drive Without Indexing**: On an external or network drive with system search indexing off, a smart folder could load indefinitely. It now stops after a short timeout.
- **Auto-Organization Could Move a File Mid-Download**: The "is this file finished writing" check was too quick and could catch a download during a brief pause, moving an incomplete file. The check is now stricter — size and modification time have to stay steady over a longer window.
- **Renaming**: Renaming to a name that already exists now shows a clear message instead of a raw error, and renaming that only changes capitalization ("Photo.JPG" → "photo.JPG") now works.
- **Applying Permissions to a Folder Could Lock You Out of Its Subfolders**: Applying something like "read-only" to a folder and everything inside it stripped subfolders of the bit that lets you open them. Subfolders now keep it.
- **The Cloud Status Icon Didn't Update During a Transfer**: A file's iCloud up/down arrow stayed frozen while it was actually uploading or downloading.
- **Disk Usage "Others" Slice Was Clickable**: Double-clicking the combined "Others (N)" slice tried to open a folder that doesn't exist and showed a "not found" error. It's no longer clickable.
- **Copying a File's Contents to the Clipboard Failed Silently**: A file that's too large or isn't text now tells you why instead of doing nothing.
- **Duplicate Finder Could Trust a Partial Read**: If a file couldn't be fully read — a failing disk, a dropped network drive — it's now left out of the results instead of risking being grouped as a duplicate on an incomplete comparison.
- **Folder Picker Could Get Stuck With No Way to Retry**: If the folder tree in a picker dialog failed to load, a "Retry" option now appears instead of a dead empty tree.
- **Terminal Drawer**: Path handling is safer for folders with spaces or special characters; the drawer only follows the browser's current folder when you open it, not while you're working in the shell; and if the shell exits it restarts instead of leaving the panel frozen.
- **The Permissions Editor No Longer Clears Special Bits**: Changing a file's regular read/write/execute settings kept its special (setuid/setgid/sticky) bits intact.
- **View Navigation Mode Wasn't Restored on Launch**: The setting was saved but never re-read at startup. Fixed.
- **Dragging a Multi-Selection**: Dragging several selected files at once now carries all of them, not just one.
- **Auto-Organization Rules Now Get an "Undo Isn't Available" Notice**: Rule-driven moves were never added to Undo history; the rules screen now says so.

### Under the Hood:
- **Auto-Organization Does Less Work Per Batch**: Moving many files at once no longer re-saves the rule list and restarts folder watching once per file.
- **Fewer Repeated Calculations While Scrolling**: File sizes, the status-bar total, and icon resizing go through shared, reused helpers instead of being rebuilt per row per frame.
- **Continued Internal Cleanup**: A large batch of code-review findings fixed — consolidated duplicated logic around settings storage, error reporting, sidebar visibility, network-drive path checks, and archive handling; removed several unused code paths.

## Version 0.3.14

### Bug Fixes:
- **Tags Didn't Match the Ones on Your Mac**: The sidebar's Tags section and the right-click Tags menu used a fixed English list, so on a Mac set to another language the tag names and colours were wrong, and tagging a file in Wiles could create a separate tag from the one your Mac already uses. Wiles now reads your Mac's own tag names and colours, so both sides act on the same tag.

### Refinements:
- **List View Dates Now Have Leading Zeros**: Dates and times in the List View columns pad to two digits — 01/02/26 08:05 instead of 1/2/26 8:05 — while still following your region's date and time format.
- **Sidebar Edge Behind the Window Buttons**: The strip behind the close/minimize/zoom buttons is now a soft translucent blur instead of a solid block, so a sidebar row scrolled to the very top stays faintly visible through it instead of disappearing.

## Version 0.3.13

### New Features:
- **Remember Each Folder's Own View**: A new Advanced Settings option lets every folder remember whether you last viewed it as a Grid or a List, instead of one setting for the whole app.

### Bug Fixes:
- **Grid View Names Could Get Stuck Cut Off Instead of Wrapping**: A long file or folder name could stay squeezed onto one line with no way to read the rest, instead of wrapping onto a second line the way it's meant to. Fixed — names now wrap properly, and selecting an item to see its full name no longer gets cut off either.
- **Grid View's Color Tags Could Be Hidden**: Color tags on a file or folder could end up hidden below the name instead of showing next to it.
- **Sidebar's Folder Tree Could Still Get Stuck With No Way to Retry**: If the folder tree failed to load, there was no way to try again. A working "Retry" option now appears.
- **Sidebar's Scrollbar Could Stay Visible Instead of Fading**: It no longer stays permanently visible when the sidebar isn't being scrolled.

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

## Earlier Highlights

Full detail only sticks around for the 5 most recent versions — everything older collapses here, down to just the features that mattered:

- **Create a file from copied text or images, sidebar auto-hide** *(0.3.10)*: Paste with nothing else copied turns a screenshot or text selection into a new file; a new setting collapses the sidebar to a slim icon rail you hover to expand.
- **Always show the full path bar** *(0.3.9)*: An Advanced setting keeps the full folder path visible in the header instead of only while hovering.
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
