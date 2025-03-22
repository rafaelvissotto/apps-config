local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'AdventureTime'
config.font = wezterm.font('FiraCode Nerd Font Mono')
config.font_size = 12
config.default_cursor_style = 'BlinkingBar'
config.enable_tab_bar = false
config.window_decorations = "RESIZE"

return config
