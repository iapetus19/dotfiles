local wezterm = require 'wezterm'

return {
  -- Font
  font = wezterm.font('JetBrains Mono'),
  font_size = 15.0,
  line_height = 1.15,

  -- Transparency
  window_background_opacity = 0.0,
  macos_window_background_blur = 8,

  colors = {
    background = 'rgba(0,0,0,0)',
  },

  -- Padding
  window_padding = {
    left = 18,
    right = 18,
    top = 16,
    bottom = 16,
  },

  -- Cursor
  default_cursor_style = "BlinkingBlock",
  cursor_blink_rate = 600,

  -- Tabs
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,

  -- Option key
  use_dead_keys = false,
  send_composed_key_when_left_alt_is_pressed = false,
  send_composed_key_when_right_alt_is_pressed = false,

  window_close_confirmation = "NeverPrompt",
}
