local wezterm = require "wezterm"
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.audible_bell = "Disabled"
config.color_scheme = "Monokai Pro (Gogh)"
config.font_size = 13
config.initial_cols = 160
config.initial_rows = 60

config.keys = {
  {
    key = "k",
    mods = "CMD",
    action = act.ClearScrollback "ScrollbackAndViewport",
  },
}

config.term = 'wezterm'

return config
