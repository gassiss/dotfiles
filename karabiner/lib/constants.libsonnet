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
  open_bracket: 'open_bracket',
  close_bracket: 'close_bracket',
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

{
  mods: mods,
  keys: keys,
}
