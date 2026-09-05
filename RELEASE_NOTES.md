# Release Notes

## Version 0.4.1

### Bug Fixes:
- **Sidebar Directory Tree Could Freeze**: Expanding certain folders in the sidebar's directory tree could freeze it. Fixed.
- **Sidebar's Scrollbar Could Disappear**: Expanding the directory tree deep enough could leave the sidebar with no visible scroll indicator, and scrolling with a mouse wheel (not a trackpad) could make it vanish and not come back until you collapsed and reopened a folder. The indicator now stays accurate through both.
- **Opening a Folder That Keeps Changing Could Load Forever**: A folder receiving a steady stream of changes — an active download, a build writing into it — could keep restarting its listing over and over and never finish loading. It now finishes even while the folder keeps changing.
- **Dragging a File Onto the Path Bar Had No Progress or Way to Cancel**: Fixed, matching other drag-and-drop destinations.
- **Batch Rename Could Lose Already-Renamed Files If Interrupted**: Cancelling a batch rename partway through, or hitting an error, could discard files that had already been renamed successfully. They're now kept.
- **Terminal Drawer Could Show a Stale Session After Reaching Its Restart Limit**: Fixed.

## Version 0.4.0

### Refinements:
- **The Path Bar Shows Where a Tag or Smart Folder Search Is**: Clicking a colour tag, or opening a saved smart folder, now shows its name in the path bar — the tag's colour and name, or the smart folder's name — instead of the raw search text. Clicking a smart folder's name opens its search for editing.
- **"No Results Found" Screen Simplified**: The redundant "Clear Search" button was removed — just the message now.
- **Moving a File Onto One With the Same Name Now Asks What to Do**: Instead of quietly replacing the existing file, Wiles shows a Replace / Keep Both / Cancel choice (with an "apply to all" option for a batch). "Replace" sends the old file to the Trash rather than destroying it.
- **Search Is Smoother While Typing**: The file list waits a fraction of a second after your last keystroke before refreshing, instead of re-running on every letter — noticeably less flicker, especially with "search everywhere" on.
- **Permanent Delete Now Asks First**: "Delete Immediately" (which skips the Trash and can't be undone) shows a confirmation, matching "Move to Trash". You can still turn confirmations off in Advanced Settings.
- **"Secure Shred" Removed**: It promised to overwrite a file's data before deleting, which modern (SSD) drives don't let any app actually guarantee. Regular permanent delete and Move to Trash are unchanged.
- **New Files and Folders Appear in the Right Place**: A newly created item slots straight into its correct sorted position in the list, instead of appearing at the top and then jumping.
- **Applying Permissions to a Whole Folder Shows Progress**: A recursive permission change now shows progress and a summary of what changed.
- **More Text Follows Your Language**: The "System Default" option in the language picker is now translated, and the summaries shown when only part of a batch succeeds — a batch rename, a shred, a paste, a move, or a Merge into PDF where some files couldn't be added — now follow your language setting instead of falling back to English.
- **Empty Search Results Now Explain Why**: When a search inside file contents turns up nothing because the term is too short, or a pattern search can't be understood, Wiles now says so instead of just showing "No Results Found".
- **Sorting a Large Folder Is Instant**: Changing the sort order (or clicking a List View column header) no longer re-reads the whole folder from disk just to reorder what's already on screen.
- **Content Search Reads Older Text Files**: Searching inside file contents now also finds matches in text files saved in an older, non-standard encoding, instead of quietly skipping them.
- **"Images" and "Archives" Quick Filters Recognise More Types**: These search shortcuts now use the system's own knowledge of file types, so formats like HEIC are matched instead of only a fixed list of extensions.
- **Copy Path → Terminal Is Safer to Paste**: The terminal-escaped Copy Path option now wraps the whole path in quotes, so paths with a leading "~", spaces, or unusual characters paste and run correctly.
- **"Merge into PDF" Only Shows for Two or More Files**: The menu item no longer appears when a single file is selected.
- **Smoother While You Work**: The icon-size slider, the Batch Rename preview as you type, the right-click "Open With" menu, and colour-tag dots in large folders all do less repeated work, so they keep up better.
- **Multiple Windows Remember Their Own Size**: Each open window keeps its own size and position instead of every window competing for one saved frame. Startup also does less work before the first window appears.
- **Keyboard Shortcuts Tidied Up**: Cmd+] now goes Forward through history (it was zooming by mistake), and Cmd+Up Arrow goes up to the enclosing folder, matching the Finder. The keyboard shortcut cheat sheet now always matches what the keys actually do.
- **Paste Greys Out When There's Nothing to Paste**: The Edit menu's Paste item now disables itself, the same way Cut and Copy already do.
- **Renaming With a "/" in the Name**: Typing a slash while renaming is now handled the way the Finder does it, instead of showing a raw error.
- **Image Folders Load Thumbnails Sooner**: Folders with a few hundred pictures now start preparing thumbnails right away, instead of only once a folder gets very large.
- **"Search Everywhere" Stops Working the Moment You Move On**: A recursive search now stops scanning as soon as you navigate away or clear the search, instead of finishing the whole crawl in the background, and it caps how much file content it will read so one stray keystroke can't trigger a long burst of disk activity.
- **Invalid Search Filters Now Explain the Empty Result**: A `size:` or `date:` filter Wiles can't make sense of (like `size:>10zz`) now says so, instead of just showing "No Results Found".
- **Thumbnail Work Stops for Pictures You've Scrolled Past**: Fast-scrolling a folder of thousands of images no longer keeps generating previews for pictures already off screen.

### Bug Fixes:
- **Saved Smart Folders Now Load Their Results Right Away**: Opening a saved smart folder showed nothing until you clicked in the search field. It now runs the search as soon as you open it, and uses the same settings as the search bar — including "search everywhere".
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
- **Terminal Drawer**: Path handling is safer for folders with spaces or special characters; the drawer only follows the browser's current folder when you open it, not while you're working in the shell; if the shell exits it restarts instead of leaving the panel frozen; and closing the window now reliably ends the shell process instead of occasionally leaving one running in the background.
- **The Permissions Editor No Longer Clears Special Bits**: Changing a file's regular read/write/execute settings kept its special (setuid/setgid/sticky) bits intact.
- **View Navigation Mode Wasn't Restored on Launch**: The setting was saved but never re-read at startup. Fixed.
- **Dragging a Multi-Selection**: Dragging several selected files at once now carries all of them, not just one.
- **Auto-Organization Rules Now Get an "Undo Isn't Available" Notice**: Rule-driven moves were never added to Undo history; the rules screen now says so.
- **Ejecting a Drive No Longer Freezes the Window**: Clicking eject on a slow or network volume kept the window unresponsive until it finished. It now works in the background.
- **Mouse Pointer Could Get Stuck**: After hovering certain controls the pointer could stay as a resize or hand shape instead of returning to normal. Fixed.
- **Sharing a Folder Over Wi-Fi Finds a Free Connection**: If the usual connection was already in use, sharing failed to start; it now falls back to another one automatically.
- **Cancelling the Duplicate Cleaner Now Stops It**: Closing the Duplicate Cleaner while it was still moving files to the Trash let the rest finish anyway. It now stops.
- **Auto-Organization Won't Accept a Self-Referential Rule**: A rule whose source and destination are really the same folder reached through a shortcut is now rejected up front.
- **Wi-Fi Share Reports an Interrupted Download**: If a file couldn't be fully read partway through, the transfer now ends with an error instead of handing over a truncated file that looks complete.
- **"Search Everywhere" Toggle Stays in Sync**: Turning it on or off from Settings now refreshes the results the same as the search bar's own toggle does.
- **Wi-Fi Share Downloads Can Resume**: A download from a shared folder that gets interrupted now picks up where it left off instead of starting over, and video and audio can be scrubbed while they stream.
- **Folder Contents Update Cleanly After a Paste, Delete, or Drag-and-Drop**: The list no longer briefly shows the old contents for a frame before settling.
- **Recent Folders Could Miss a Match After Restarting**: A folder in the Recents list might not highlight as your current location, or briefly show up twice, until you visited it again. It now stores every path the same way, so matches are consistent from launch.
- **A Loading Spinner Could Stick After Renaming**: Starting to rename a just-created item while its folder was still loading could leave the spinner turning until the next refresh. It now clears right away — and if another app changes the folder while a rename is open, those changes appear as soon as you finish the rename instead of waiting for the next unrelated update.
- **File Operation Progress Showed in Every Window**: With more than one window open, a copy or move started from one window also appeared in every other window's footer and operations popover. Each window now shows only its own.
- **Preference Changes Made Right Before Quitting Could Be Lost**: Adjusting the icon-size slider, the sidebar width, a List View column width, or which folders are expanded in the Directory Tree and then quitting within a fraction of a second could lose that change on the next launch. Pending settings are now flushed on quit.
- **Extracting an Archive Could Overwrite a File That Differs Only in Capitalization**: On a drive that treats "Report" and "report" as the same name, an archive whose top-level folder matched an existing item that way could be written over without warning. Wiles now treats that as a name clash and extracts into its own subfolder.
- **Stopping a Wi-Fi Folder Share Could Briefly Freeze the Window**: If the shared folder lived on a slow drive, stopping the share (or closing its window) could hang the window for a moment. The teardown now runs in the background.
- **Restarting a Wi-Fi Folder Share Keeps the Same Address**: Sharing a different folder without stopping first no longer bumps the share to the next port — a link you already copied keeps working.
- **VoiceOver Reads More of a File Row**: The add/remove-favorite button now says what it does, and purely decorative icons, thumbnails, and colour-tag dots are skipped so they aren't read out on top of the row's own label.
- **Backspace in the Terminal Drawer Could Send Selected Files to the Trash**: With the terminal open and files selected in the list behind it, pressing Backspace (or an arrow key, Return, or F2) acted on the file list instead of the shell. Keystrokes now go to the terminal while it's focused.
- **Dragging a File Onto a Folder Can Now Be Undone**: A move done by drag-and-drop wasn't added to Undo history — and if you chose "Replace", the file it displaced went to the Trash with no way to get it back. Both are now undoable.
- **A Failed Replace-Move No Longer Trashes the Original First**: When moving a file onto one with the same name and choosing "Replace", the existing file is only sent to the Trash after the incoming move actually succeeds — a move that fails leaves everything untouched.
- **Replacing a File on a Drive With No Trash No Longer Loses It**: Choosing "Replace" while moving a file onto one with the same name, on a network share or external drive that has no Trash, could permanently delete the file being replaced, with no way to undo. That file is now kept in the same folder with " (replaced)" added to its name, and Undo can still restore it.
- **"Couldn't Move to Trash" Shown by Mistake**: Deleting a file whose name already existed in the Trash could report a failure (and skip adding it to Undo) even though the file was trashed correctly.
- **Undo Now Tells You When It Couldn't Fully Restore**: If undoing a rename or move can't put the file back under its original name because that name is taken again, Wiles now says it was restored under a different name instead of silently leaving you to notice.
- **Opening a Malformed ZIP No Longer Crashes**: A corrupt or hand-crafted ZIP64 archive could crash the Archive Inspector on open; it now just shows no entries.
- **Closing the Archive Inspector Stops a Single-File Extraction**: Pulling one file out of a large archive and then closing the window let the extraction keep running in the background, and a crash partway through could leave a hidden temporary folder behind. Closing now stops the work, and any such leftover folder is cleaned up on the next extraction.
- **Redoing an Undone File Creation Is a Quiet No-Op**: Pressing Redo after undoing a "paste as file", image conversion, or PDF merge showed an error dialog and got stuck; it now simply does nothing.
- **Deleting a Smart Folder No Longer Says "Move to Trash"**: A smart folder is a saved search — its delete confirmation button is now labelled accordingly.
- **Connecting to a Shared Folder Whose Name Has Spaces**: "Connect to Server" now accepts a share name containing spaces instead of rejecting it as an invalid address.
- **An Interrupted Batch Rename Won't Leave a File Hidden**: If a batch rename was cancelled or hit an error partway through, a participating file could be left under a hidden temporary name. Wiles now restores it to a visible name (and cleans up any such leftover from a past crash on the next batch rename).
- **The Auto-Organization Stability Check Is Stricter for Cross-Drive Moves**: When an auto-organization rule moves files to a different drive, the "is this file finished writing" check now requires more consecutive unchanged windows, since a cross-drive move copies then deletes and can't be undone.
- **Emptying the Trash Reports a Drive It Couldn't Reach**: If one volume's Trash couldn't be read, "Empty Trash" no longer reports total success while leaving that volume untouched — and it can now be cancelled.
- **One Bad Auto-Organization Rule No Longer Wipes Them All**: If a single saved rule couldn't be read back (a corrupt entry, or one saved by a newer version), every rule vanished on the next launch with no notice. The unreadable rule is now skipped and the rest are kept.
- **Adding a Tag No Longer Erases One Added Elsewhere**: If another app (or a Finder window) added a tag to a file since Wiles last listed its folder, tagging that file in Wiles could drop the other tag. Wiles now re-reads the file's current tags just before writing.
- **Missing Translations Fall Back to English**: A screen shown in a language that happens to be missing a particular phrase now shows the English text instead of a raw internal name.
- **Starting a Wi-Fi Folder Share No Longer Briefly Freezes the Window**: Picking a free port (which can involve a short wait) now happens in the background, so the share dialog stays responsive.
- **Clicking a File Then Using the Keyboard No Longer Opens a Stray Rename Box**: Clicking an already-selected item and then moving the selection with the arrow keys within a moment could leave an inline rename field open on nothing.
- **Closing the Properties Sheet Stops a Folder-Wide Permission Change**: Dismissing the sheet while "apply to enclosed items" is still running now cancels the rest instead of letting it finish in the background.
- **Hover Tooltips Refresh When a File Changes**: A file's hover tooltip (page count, image size, dates) now updates after the file is edited or replaced, instead of showing the old details until the app had seen many other files.

### Under the Hood:
- **Auto-Organization Does Less Work Per Batch**: Moving many files at once no longer re-saves the rule list and restarts folder watching once per file.
- **Fewer Repeated Calculations While Scrolling**: File sizes, the status-bar total, icon resizing, tag colours, and the "cut" state of a row now go through shared, cached helpers instead of being rebuilt per row per frame. Search filters read a file's details once per file instead of once per filter term.
- **Settings Storage Split Into Focused Pieces**: The single object holding every saved preference is now separated into view, sidebar, search, appearance, and favorites groups, each next to the code that uses it — making future changes safer and smaller.
- **Continued Internal Cleanup**: A large batch of code-review findings fixed — one shared implementation for the "Copy Path" submenu (previously written four times), one source of truth for which sidebar sections are shown, and a wide sweep of named constants, consolidated duplicated logic, and removed dead code across services, views, and error handling. A further round followed: one shared folder-tree component behind the sidebar and the folder pickers, one source of truth for every keyboard shortcut and its label, one shared list of image file types, and lighter work per row while scrolling large folders. And another: the background-operations tracker and the thumbnail prefetcher are now per-window (so two windows no longer interfere with each other's progress or thumbnail loading), a rapid smart-folder switch stops the old query's work instead of finishing it unused, and the Duplicate Finder lists groups and picks which copy to keep in a stable order. And a final sweep of about forty more findings: long-running background scans and merges now genuinely stop when you move on (via one shared cancellable-work helper); the terminate-time save of pending preferences is handled by one self-registering mechanism and from a single app-level hook rather than once per window; folder-watch setup and the recents check no longer touch the disk on the main thread during window creation; the recursive-permissions apply, the terminal focus check, and the HTTP response-header builder are each a single implementation with tests; and the "Open With" and Finder-tag caches refresh on the right system events instead of on a timer inside view drawing. And one more round: the safeguards behind replace-moves and archive extraction were hardened (see Bug Fixes above), the wait for an archive tool to finish is now interruptible through the same shared helper the rest of the background work uses, and a compatibility check was added so a future update to the terminal component can't quietly leave a shell process running.

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

## Earlier Highlights

- **0.3.11**: Batch Rename gained a Regex mode alongside Find & Replace, Prefix & Suffix, and Sequence Number.

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)
