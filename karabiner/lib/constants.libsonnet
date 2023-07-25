local keys = {
  sft: 'left_shift',
  ctl: 'left_control',
  opt: 'left_option',
  cmd: 'left_command',
  caps: 'caps_lock',
  semicolon: 'semicolon',
  comma: 'comma',
  period: 'period',
  quote: 'quote',
  backtick: 'grave_accent_and_tilde',
  hyphen: 'hyphen',
  equal: 'equal_sign',
  slash: 'slash',
  backslash: 'backslash',
  open_bracket: 'open_bracket',
  close_bracket: 'close_bracket',
  left: 'left_arrow',
  right: 'right_arrow',
  up: 'up_arrow',
  down: 'down_arrow',
  enter: 'return_or_enter',
  esc: 'escape',
  bspc: 'delete_or_backspace',
  tab: 'tab',
  none: 'vk_none',
};

local mods = {
  none: [],
  sft: [keys.sft],
  ctl: [keys.ctl],
  opt: [keys.opt],
  cmd: [keys.cmd],
  caps: [keys.caps],
  any: ['any'],
  hyper: [keys.sft, keys.ctl, keys.opt, keys.cmd],
};

local apps = {
  wezterm: ['com.github.wez.wezterm'],
};

{
  mods: mods,
  keys: keys,
  apps: apps,
}
