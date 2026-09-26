# Release Notes

## Version 0.5.0

### Refinements:
- **Bug Reports & Crash Reports Now Go Through a Dedicated Relay**: Sending feedback, filing a bug report, or an automatic crash report no longer talks to GitHub directly from the app — it now goes through a small relay we control instead. No change in what you see or do; it's just a safer path for your reports to reach us.

## Version 0.4.11

### New Features:
- **Shortcuts Are Now Fully Customizable**: Settings has a new Shortcuts tab. Pick Windows or Mac to use that platform's familiar keyboard shortcuts, or pick Custom and remap any shortcut yourself — click it in the list, press the new key combination, done. If a combination is already taken, Wiles asks before handing it over.
- **One Complete Shortcuts List**: The quick reference sheet (`Cmd + /`) no longer splits shortcuts across separate Windows/Mac/All tabs — it's one list that always matches whatever's actually active, including your own Custom choices.

## Version 0.4.10

### New Features:
- **Minimize Wi-Fi Sharing Instead of Closing It**: The "Share Folder over Wi-Fi" window can now be minimized while sharing is active — sharing keeps running, and a Wi-Fi icon appears in the bottom status bar so you can reopen the window anytime. The window's main button is now "Stop & Close" instead of a plain "Close", so it's clear what it actually does.

### Bug Fixes:
- **Renaming in Grid View Could Show a Blank Extra Line**: Right after starting a rename in Grid View, the editable name box was often narrower than the label it replaced and could show one blank line even for short names that fit on one line just fine. It now matches the label's size and only grows when a name actually needs more room.
- **Share Folder over Wi-Fi Window Could Cut Off Its Own Text**: This window had a fixed size that didn't always leave enough room for its content, sometimes cutting off the notice about the connection not being encrypted. It now sizes itself to whatever it's showing.

### Refinements:
- **Share Folder over Wi-Fi Now Explains the Username Prompt**: Connecting to a password-protected shared folder still asks for a username as well as a password — the window now notes that any username works, since only the password is checked.

## Version 0.4.9

### Bug Fixes:
- **Grid View Could Wrap a Short Name Down to a Single Leftover Letter**: A name like "Documents" could break onto a second line for just its last letter even though there was still room on the first line — the width used to check whether it fit was rounded down more than it needed to be. That check is now tighter, so short names fit on one line as expected.

### Refinements:
- **Sidebar Now Shows a Frosted Blur Behind the Window Buttons**: The area behind the close/minimize/zoom buttons at the top of the sidebar now has a visible frosted-glass blur, instead of scrolled content just sliding past underneath with no visual separation.

## Version 0.4.8

### Bug Fixes:
- **Choosing a Folder for Auto-Organization Could Freeze the Whole App**: Picking a folder several levels deep (or with an ancestor folder holding a lot of items) in the Auto-Organization folder browser could make Wiles stop responding for the scan's duration. It now scans in the background, keeping the app responsive.
- **Browsing Could Momentarily Stall When Several Folders Loaded Icons at Once**: Opening multiple windows or navigating quickly could pile up icon-loading work faster than it was meant to run, occasionally making the app feel briefly stuck. Icon loading is now properly capped to run a few at a time as intended.

### Refinements:
- **Trash Restore Now Says "Restoring…" Instead of a Generic "Undoing…"**: Undoing a "Move to Trash" gave no sign of what it was actually doing while it restored the file, which can take a couple of seconds for a large item — it just showed the same "Undoing…" every other undo uses. It now says "Restoring…" instead.

---

👉 For everything shipped before this, see [Features](FEATURES.md).

---

## 💬 Feedback, Feature Requests & Bug Reports

Have a feature request or found a bug? We welcome your feedback!

- 🐛 **Report a Bug**: [Open a Bug Report](https://github.com/marcops/wiles/issues/new?template=bug_report.md)
- 💡 **Request a Feature**: [Submit a Feature Request](https://github.com/marcops/wiles/issues/new?template=feature_request.md)
