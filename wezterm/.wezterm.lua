local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

--------------------------------------------------
-- Performance
--------------------------------------------------

config.front_end = "WebGpu"
config.max_fps = 120
config.animation_fps = 120
config.check_for_updates = false

--------------------------------------------------
-- Font
--------------------------------------------------

config.font = wezterm.font_with_fallback({
	"Hack Nerd Font Mono",
	"SF Mono",
	"Apple Color Emoji",
})

config.font_size = 16
config.line_height = 1.12
config.cell_width = 1.0

--------------------------------------------------
-- Window
--------------------------------------------------

config.initial_cols = 150
config.initial_rows = 40

config.window_padding = {
	left = 20,
	right = 20,
	top = 18,
	bottom = 18,
}

config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "TITLE | RESIZE"
config.native_macos_fullscreen_mode = false

--------------------------------------------------
-- Appearance
--------------------------------------------------

config.window_background_opacity = 0.72
config.macos_window_background_blur = 25

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650

config.hide_mouse_cursor_when_typing = true
config.scrollback_lines = 15000

--------------------------------------------------
-- macOS
--------------------------------------------------

config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

--------------------------------------------------
-- Leader
--------------------------------------------------

config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1200,
}

--------------------------------------------------
-- Tabs
--------------------------------------------------

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 32

--------------------------------------------------
-- Pane Dimming
--------------------------------------------------

config.inactive_pane_hsb = {
	saturation = 0.85,
	brightness = 0.70,
}

--------------------------------------------------
-- Gruvbox
--------------------------------------------------

config.colors = {

	background = "#000000",

	foreground = "#ebdbb2",

	cursor_bg = "#d79921",
	cursor_fg = "#000000",
	cursor_border = "#d79921",

	selection_bg = "#3c3836",
	selection_fg = "#ebdbb2",

	scrollbar_thumb = "#504945",

	tab_bar = {

		background = "#000000",

		active_tab = {
			bg_color = "#d79921",
			fg_color = "#000000",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#1d2021",
			fg_color = "#928374",
		},

		inactive_tab_hover = {
			bg_color = "#282828",
			fg_color = "#ebdbb2",
		},

		new_tab = {
			bg_color = "#1d2021",
			fg_color = "#928374",
		},
	},
}

--------------------------------------------------
-- Keybindings
--------------------------------------------------

config.keys = {

	-- Panes

	{
		key = "-",
		mods = "LEADER",
		action = act.SplitVertical {
			domain = "CurrentPaneDomain",
		},
	},

	{
		key = "\\",
		mods = "LEADER",
		action = act.SplitHorizontal {
			domain = "CurrentPaneDomain",
		},
	},

	{
		key = "z",
		mods = "LEADER",
		action = act.TogglePaneZoomState,
	},

	{
		key = "x",
		mods = "LEADER",
		action = act.CloseCurrentPane {
			confirm = false,
		},
	},

	-- Navigation

	{
		key = "h",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Left"),
	},

	{
		key = "j",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Down"),
	},

	{
		key = "k",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Up"),
	},

	{
		key = "l",
		mods = "LEADER",
		action = act.ActivatePaneDirection("Right"),
	},

	-- Resize

	{
		key = "H",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},

	{
		key = "J",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},

	{
		key = "K",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Up", 5 }),
	},

	{
		key = "L",
		mods = "LEADER|SHIFT",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},

	-- Copy mode

	{
		key = "[",
		mods = "LEADER",
		action = act.ActivateCopyMode,
	},

	-- Launcher

	{
		key = "p",
		mods = "LEADER",
		action = act.ShowLauncher,
	},

	{
		key = "s",
		mods = "LEADER",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
}

return config
