local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.color_scheme = 'Gruvbox dark, medium (base16)'
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.leader = { key = '+', mods = 'NONE', timeout_milliseconds = 1000 }
config.keys = {
  { key = '+', mods = 'LEADER', action = wezterm.action.SendString('+') },
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = '[', mods = 'LEADER', action = act.ActivateCopyMode },
  { key = 'a', mods = 'LEADER', action = act.ActivateTab(0) },
  { key = 'o', mods = 'LEADER', action = act.ActivateTab(1) },
  { key = 'e', mods = 'LEADER', action = act.ActivateTab(2) },
  { key = 'u', mods = 'LEADER', action = act.ActivateTab(3) },
  { key = 'i', mods = 'LEADER', action = act.ActivateTab(4) },
  { key = ';', mods = 'LEADER', action = act.SwitchToWorkspace({ name = 'default' }) },
  { key = ',', mods = 'LEADER', action = act.SwitchToWorkspace({ name = '1' }) },
  { key = '.', mods = 'LEADER', action = act.SwitchToWorkspace({ name = '2' }) },
  { key = 'p', mods = 'LEADER', action = act.SwitchToWorkspace({ name = '3' }) },
  { key = 'y', mods = 'LEADER', action = act.SwitchToWorkspace({ name = '4' }) },
  { key = "'", mods = 'LEADER', action = act.TogglePaneZoomState },
  { key = 'h', mods = 'LEADER', action = act.ActivatePaneDirection("Left") },
  { key = 'j', mods = 'LEADER', action = act.ActivatePaneDirection("Down") },
  { key = 'k', mods = 'LEADER', action = act.ActivatePaneDirection("Up") },
  { key = 'l', mods = 'LEADER', action = act.ActivatePaneDirection("Right") },
  { key = 'v', mods = 'LEADER', action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = 'g', mods = 'LEADER', action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = 'n', mods = 'LEADER', action = act { SpawnTab = "CurrentPaneDomain" } },
  { key = 'r', mods = 'CMD',    action = act.ActivateCommandPalette },
  { key = 'd', mods = 'CMD',    action = act.QuickSelect },
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable({
      name = 'resize',
      one_shot = false,
      timeout_milliseconds = 1000
    })
  },
}

config.key_tables = {
  search_mode = {
    { key = "Escape", mods = "NONE", action = act { CopyMode = "Close" } },
    { key = 'v',      mods = 'CTRL', action = 'ActivateCopyMode' },
    { key = "n",      mods = "CTRL", action = act { CopyMode = "NextMatch" } },
    { key = "p",      mods = "CTRL", action = act { CopyMode = "PriorMatch" } },
    { key = "n",      mods = "CTRL", action = act { CopyMode = "NextMatch" } },
    { key = "p",      mods = "CTRL", action = act { CopyMode = "PriorMatch" } },
    { key = "r",      mods = "CTRL", action = act.CopyMode("CycleMatchType") },
    { key = "u",      mods = "CTRL", action = act.CopyMode("ClearPattern") },
  },
  resize = {
    { key = "Escape", mods = "NONE", action = 'PopKeyTable' },
    { key = "q",      mods = "NONE", action = 'PopKeyTable' },
    { key = "c",      mods = "NONE", action = 'PopKeyTable' },
    { key = 'h',      mods = 'NONE', action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = 'h',      mods = 'SHIFT', action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = 'l',      mods = 'NONE', action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = 'l',      mods = 'SHIFT', action = act.AdjustPaneSize({ "Right", 5 }) },
    { key = 'k',      mods = 'NONE', action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = 'k',      mods = 'SHIFT', action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = 'j',      mods = 'NONE', action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = 'j',      mods = 'SHIFT', action = act.AdjustPaneSize({ "Down", 5 }) },
  }
}

return config
