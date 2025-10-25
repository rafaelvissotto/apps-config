local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

local scheme = wezterm.color.get_builtin_schemes()["Bright Lights"]
scheme.brights[1] = "Gray" -- great theme, but I cannot read commented lines...
config.colors = scheme

config.window_background_opacity = 0.9
config.text_background_opacity = 0.7
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 11

config.scrollback_lines = 10000
config.enable_scroll_bar = true

config.keys = {
	{
		key = "(",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = ")",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "PageUp",
		mods = "SHIFT",
		action = act.ScrollByPage(-0.5),
	},
	{
		key = "PageDown",
		mods = "SHIFT",
		action = act.ScrollByPage(0.5),
	},
	{
		key = "UpArrow",
		mods = "SHIFT",
		action = act.ScrollByLine(-1),
	},
	{
		key = "DownArrow",
		mods = "SHIFT",
		action = act.ScrollByLine(1),
	},
	{
		key = "F",
		mods = "CTRL|SHIFT",
		action = act.Search({ Regex = "" }),
	},
	{
		key = "w",
		mods = "CTRL",
		action = act.CloseCurrentPane({ confirm = true }),
	},
}

return config
