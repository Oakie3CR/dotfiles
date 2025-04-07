---@type Wezterm
local wezterm = require("wezterm")
local act = wezterm.action

---@type Config
local config = wezterm.config_builder()

config.audible_bell = "Disabled"
config.color_scheme = "Monokai Pro (Gogh)"
config.font_size = 13
config.initial_cols = 160
config.initial_rows = 60

config.keys = {
  {
    key = "k",
    mods = "CMD",
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },
}

config.term = "wezterm"

return config
