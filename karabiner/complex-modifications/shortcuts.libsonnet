local h = import '../lib/helpers.libsonnet';
local
  from = h.from,
  open = h.open,
  keystroke = h.keystroke,
  shell_cmd = h.shell_cmd;
local c = import '../lib/constants.libsonnet';

{
  description: 'App shortcuts with hyper key',
  manipulators: [
    from('d', c.mods.hyper) + { to: shell_cmd(open('firefox')) },
    from('s', c.mods.hyper) + { to: shell_cmd(open('wezterm')) },
    from('g', c.mods.hyper) + { to: shell_cmd(open('safari')) },
    // shortcut('m', [open('firefox'), keystroke('1', 'command')]),
  ],
}
