# Hammerspoon Configuration

This repository contains a personal Hammerspoon configuration for macOS.

Files
- `init.lua`: Main Hammerspoon configuration file.
- `Spoons/`: Optional Folder for installed Spoons (extensions).

Installation
1. Clone or copy this repo to your Hammerspoon configuration directory (`~/.hammerspoon`).
   - To clone: `git clone <repo-url> ~/.hammerspoon`
   - Or copy the files into the existing `~/.hammerspoon` directory.
2. Reload Hammerspoon: open Hammerspoon and click "Reload Config" or run `hs.reload()` from the Hammerspoon console.

Usage & customization
- Edit `init.lua` to customize hotkeys, window management, automation, and other behaviors.
- Put third-party Spoons inside the `Spoons/` folder and load them from `init.lua`.

Troubleshooting
- If Hammerspoon doesn't respond after changes, check the Hammerspoon Console for Lua errors.
- Ensure accessibility permissions are granted in System Settings → Privacy & Security → Accessibility.

Contributing
- This is a simple personal config; feel free to copy and make your own adjustments

License
- MIT License
