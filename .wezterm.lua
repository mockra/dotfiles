-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Tokyo Night Moon'

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font 'Cartograph CF'

config.keys = {
  {
    key = 'LeftArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivateTabRelative(-1)
  },
  {
    key = 'RightArrow',
    mods = 'SUPER',
    action = wezterm.action.ActivateTabRelative(1)
  },
}

config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = wezterm.action.OpenLinkAtMouseCursor,
  },
}

-- and finally, return the configuration to wezterm
return config
