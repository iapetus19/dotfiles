local wezterm = require("wezterm")

local config = {}

-- ===========================
-- Renderer
-- ===========================

config.front_end = "WebGpu"
config.animation_fps = 120
config.max_fps = 120

-- ===========================
-- Font
-- ===========================

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 16
config.line_height = 1.12
config.cell_width = 1.0

-- ===========================
-- Window
-- ===========================

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

-- ===========================
-- Transparency
-- ===========================

config.window_background_opacity = 0.7

config.macos_window_background_blur = 20

-- ===========================
-- Colors
-- ===========================

config.colors = {
	background = "#000000",

	cursor_bg = "#7CFC00",
	cursor_fg = "#000000",

	selection_bg = "#2b2b2b",
	selection_fg = "#ffffff",

	scrollbar_thumb = "#333333",

	tab_bar = {
		background = "#000000",

		active_tab = {
			bg_color = "#7CFC00",
			fg_color = "#000000",
			intensity = "Bold",
		},

		inactive_tab = {
			bg_color = "#111111",
			fg_color = "#777777",
		},

		new_tab = {
			bg_color = "#111111",
			fg_color = "#666666",
		},
	},
}

-- ===========================
-- Cursor
-- ===========================

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650

-- ===========================
-- Tab Bar
-- ===========================

config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_tab_index_in_tab_bar = false
config.tab_max_width = 32

-- ===========================
-- Scrollback
-- ===========================

config.scrollback_lines = 10000

-- ===========================
-- Mouse
-- ===========================

config.hide_mouse_cursor_when_typing = true

-- ===========================
-- macOS
-- ===========================

config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ===========================
-- Performance
-- ===========================

config.check_for_updates = false

return config
