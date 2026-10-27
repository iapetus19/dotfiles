# 🪟 Dotfiles & Workspace Setup

My personal macOS dotfiles and configuration files, engineered for a fast, minimalist, and highly efficient tiling window management workflow.

---

## 🛠️ Tech Stack & Components

* **Window Manager**: [AeroSpace](https://github.com/nikitabobko/AeroSpace) (i3-like tiling window manager for macOS)
* **Status Bar**: [SketchyBar](https://github.com/FelixKratz/SketchyBar) (highly customizable macOS status bar)
* **Terminal**: [WezTerm](https://wezfurlong.org/wezterm/) (GPU-accelerated terminal emulator)
* **Text Editor**: Visual Studio Code
* **Shell**: Zsh (with fastfetch system info)

---

## 📁 Repository Structure

```text
├── aerospace/
│   └── aerospace.toml        # Tiling layout, gaps, and workspace bindings
├── sketchybar/
│   ├── sketchybarrc          # Main SketchyBar configuration
│   ├── items/                # Status bar modules (spaces, media, system stats)
│   └── plugins/              # Dynamic action scripts
├── wezterm/
│   └── .wezterm.lua          # Terminal styling and keybindings
├── vscode/
│   ├── settings.json         # VS Code user preferences
│   └── keybindings.json      # Custom editor keymaps
└── fastfetch/
    └── config.jsonc          # System fetch information display
The configuration maps workspaces across dual monitors:Monitor 1 (Primary): Workspaces 1 – 5Monitor 2 (Secondary): Workspaces 6 – 9ActionKeybindingDescriptionFocus WindowsAlt + (Left / Down / Up / Right)Move focus between adjacent windowsMove WindowsAlt + Shift + (Left / Down / Up / Right)Shift current window positionSwitch WorkspaceAlt + [1-9]Jump to workspace 1 through 9Move to WorkspaceAlt + Shift + [1-9]Send window to workspace and follow itCycle MonitorsAlt + MJump to the next physical displayLayout TogglesAlt + Slash / Alt + CommaSwitch between horizontal/vertical tiles and accordionService ModeAlt + Shift + ;Enter service mode (resizing, joining nodes)🚀 Quick Setup & InstallationTo clone and link these dotfiles on a fresh macOS installation:Clone the repository:Bashgit clone [https://github.com/iapetus19/dotfiles.git](https://github.com/iapetus19/dotfiles.git) ~/Developer/dotfiles
Symlink configuration files:Bashln -s ~/Developer/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -s ~/Developer/dotfiles/sketchybar ~/.config/sketchybar
ln -s ~/Developer/dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua
Reload Services:Bashaerospace reload-config
sketchybar --reload
