---@type Wezterm
local w = require("wezterm")

local act = w.action

---@type Config
local config = w.config_builder()
--
-- State storage (per window)
local pane_state = {}

local function is_vertical_split(pane)
  local dims = pane:get_dimensions()
  return dims.pixel_height > dims.pixel_width
end

local function toggle_vertical_maximize(win, pane)
  local window_id = win:window_id()
  pane_state[window_id] = pane_state[window_id] or {}

  local state = pane_state[window_id]

  -- Only operate on vertical splits
  if not is_vertical_split(pane) then
    return
  end

  -- RESTORE
  if state.active then
    for _, action in ipairs(state.restore_actions) do
      win:perform_action(action, pane)
    end
    win:perform_action(act.ActivatePaneById(state.original_pane_id), pane)

    state.active = false
    return
  end

  -- MAXIMIZE
  state.active = true
  state.original_pane_id = pane:pane_id()
  state.restore_actions = {}

  -- Collapse panes above
  while true do
    local moved = pane:move_to_pane("Up")
    if not moved then
      break
    end
    table.insert(state.restore_actions, act.AdjustPaneSize({ "Down", 5 }))
    win:perform_action(act.AdjustPaneSize({ "Up", 5 }), pane)
  end

  -- Return to original pane
  win:perform_action(act.ActivatePaneById(state.original_pane_id), pane)

  -- Collapse panes below
  while true do
    local moved = pane:move_to_pane("Down")
    if not moved then
      break
    end
    table.insert(state.restore_actions, act.AdjustPaneSize({ "Up", 5 }))
    win:perform_action(act.AdjustPaneSize({ "Down", 5 }), pane)
  end

  -- Focus maximized pane
  win:perform_action(act.ActivatePaneById(state.original_pane_id), pane)
end

local smart_splits = w.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

config.audible_bell = "Disabled"
config.color_scheme = "Monokai Pro (Gogh)"
config.font_size = 13
config.initial_cols = 160
config.initial_rows = 60

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  -- clear the scrollback history
  {
    key = "k",
    mods = "CMD",
    action = act.ClearScrollback("ScrollbackAndViewport"),
  },
  {
    -- split pane vertically
    -- tmux uses '%' for vertical split
    -- other popular options are 'v' and '|'
    key = "\\",
    mods = "LEADER",
    -- if I want to change to the pipe, then the mods like would look like
    -- mods = "LEADER|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    -- split pane horizontally
    -- tmux uses '"' for horizontal split
    -- other popular options are 'h' and '='
    key = "-",
    mods = "LEADER",
    -- action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    action = w.action_callback(toggle_verticle_maximize),
  },
  {
    -- maximize one window
    key = "m",
    mods = "LEADER",
    action = act.TogglePaneZoomState,
  },
  {
    -- rotate panes clockwise
    key = "Space",
    mods = "LEADER",
    action = act.RotatePanes("Clockwise"),
  },
  {
    -- show the pane selection mode, and then have it swap active and selected panes
    mods = "LEADER",
    key = "0",
    action = act.PaneSelect({
      mode = "SwapWithActive",
    }),
  },
  {
    -- vim mode in the terminal so I can copy from the history
    key = "Enter",
    mods = "LEADER",
    action = act.ActivateCopyMode,
  },
}

config.term = "wezterm"

smart_splits.apply_to_config(config, {
  -- the default config is here, if you'd like to use the default keys,
  -- you can omit this configuration table parameter and just use
  -- smart_splits.apply_to_config(config)

  -- directional keys to use in order of: left, down, up, right
  direction_keys = { "h", "j", "k", "l" },
  -- if you want to use separate direction keys for move vs. resize, you
  -- can also do this:
  -- direction_keys = {
  --   move = { 'h', 'j', 'k', 'l' },
  --   resize = { 'LeftArrow', 'DownArrow', 'UpArrow', 'RightArrow' },
  -- },
  -- modifier keys to combine with direction_keys
  modifiers = {
    move = "CTRL", -- modifier to use for pane movement, e.g. CTRL+h to move left
    resize = "META", -- modifier to use for pane resize, e.g. META+h to resize to the left
  },
  -- log level to use: info, warn, error
  log_level = "info",
})

return config
