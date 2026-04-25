# Cyan Rice Dotfiles (WIP | develop stage)

This repository contains personal config files (dotfiles) for Arch Linux, featuring high customize Hyprland setup with a consistent **Cyan Color** aesthetic.


## Project Overview

- **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland Compositor)
- **Shell:** [Fish Shell](https://fishshell.com/) with [Starship](https://starship.rs/) prompt
- **Editor:** [Neovim](https://neovim.io/) (using the [LazyVim](https://www.lazyvim.org/) distribution)
- **Status Bar:** [Waybar](https://github.com/Alexays/Waybar)
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Theme:** Custom Cyan-themed UI components (`#00ffff`), including borders, prompt, and terminal colors.

## Directory Structure

```text
.config/
├── alacritty/
├── btop/
├── cava/
├── fastfetch/
├── fish/
├── hypr/
│   ├── conf/
│   ├── hyprland.conf
│   ├── hyprlock.conf
│   └── hyprpaper.conf
├── hyprlock/
├── kitty/
├── nvim/
├── rofi/
├── wallpapers/
├── waybar/
├── wlogout/
└── yazi/
```

## Key Program

As defined in `hypr/conf/programs.conf`:

- **Terminal:** Kitty
- **File Manager:** Dolphin
- **Menu/Launcher:** Rofi (Cyan-cyber theme)
- **Browser:** Firefox
- **Editor:** Neovim
- **Lock Screen:** Hyprlock
- **Logout:** Wlogout

## Keybinding

The following shortcuts are defined in `hypr/conf/keybindings.conf`:

- `Super + Return` / `Q`: Open Terminal
- `Super + B`: Open Browser
- `Super + E`: Open File Manager
- `Super + D`: Open Rofi Launcher
- `Super + Shift + R`: Reload Hyprland
- `Super + Shift + W`: Reload Waybar
- `Super + L`: Lock Screen
- `Super + Shift + Q`: Close active window
- `Super + 1-10`: Switch workspaces
- `Super + Shift + 1-10`: Move window to workspace
- `Super + V`: Toggle floating
- `Super + M`: Exit/Power Menu

## Usage

These configurations are designed to be located in `~/.config/`. 
- To apply changes to Hyprland, reload the compositor (usually automatic on save or via `hyprctl reload`).
- To reload Waybar, use the script at `waybar/reload.sh`.
## Credits

This setup is built upon the incredible work of the open-source community. special thanks to:

- **[Aditya Shakya (adi1090x)](https://github.com/adi1090x/rofi):** For the beautiful Rofi configurations and themes that form the basis of the launcher and power menu.
- **[Muhammad Diaz (MDiaznf23)](https://github.com/MDiaznf23):** For the some config  on `simple-autoricing-i3wm-dotfiles`.
- **[LazyVim](https://www.lazyvim.org/):** For the modern and powerful Neovim config framework.
- **[Shivam Salkar (minimal-waybar-config)](https://github.com/shivam-salkar/minimal-waybar-config):** For the sleek and minimal Waybar configuration that serves as the base for the status bar.
- **[Hyprland Community](https://hyprland.org/):** For the amazing Wayland compositor.
- **Arch Linux:** For being the foundation of this ricing journey.
