local common = import 'common.libsonnet';

local shortcut(key, command) = {
  type: 'basic',
  from: {
    key_code: key,
    modifiers: common.modifiers.hyper,
  },
  to: [
    {
      shell_command: std.join('; ', command),
    },
  ],
};

local open(app) = 'open -a "%s.app"' % app;
local keystroke(key, mod='') =
  "osascript -e 'tell application \"System Events\" to keystroke \"%s\"%s'" %
  [
    key,
    if mod != '' then ' using {%s down}' % mod else '',
  ]
;

{
  description: 'App shortcuts with hyper key',
  manipulators: [
    shortcut('d', [open('firefox')]),
    shortcut('s', [open('wezterm')]),
    shortcut('m', [open('firefox'), keystroke('1', 'command')]),
  ],
}
