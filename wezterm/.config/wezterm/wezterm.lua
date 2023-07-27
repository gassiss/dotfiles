local wezterm = require("wezterm")
local act = wezterm.action
local config = {}

config.color_scheme = "Gruvbox dark, medium (base16)"
config.hide_tab_bar_if_only_one_tab = true
config.font = wezterm.font('Comic Code')
config.tab_bar_at_bottom = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.keys = {
  {
    key = 'Backspace',
    mods = 'OPT',
    action = act.SendKey {
      key = 'w',
      mods = 'CTRL',
    },
  },
  {
    key = 'Backspace',
    mods = 'CMD',
    action = act.SendKey {
      key = 'u',
      mods = 'CTRL',
    },
  },
  {
    key = 'Backspace',
    action = act.SendKey {
      key = 'h',
      mods = 'CTRL',
    },
  },
  {
    key = 'Delete',
    action = act.SendKey {
      key = 'd',
      mods = 'CTRL',
    },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'f',
      mods = 'CTRL',
    },
  },
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey {
      key = 'b',
      mods = 'CTRL',
    },
  },
}

return config
