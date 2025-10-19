local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.color_scheme = 'Bright Lights'
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 12
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 5000
config.enable_scroll_bar = true

config.keys = {
	{
		key = '(',
		mods = 'CTRL|SHIFT',
		action = act.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	{
		key = ')',
		mods = 'CTRL|SHIFT',
		action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
}

return config
