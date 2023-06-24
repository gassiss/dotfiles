local common = import 'common.libsonnet';

local shortcut(key, app) = {
  from: {
    key_code: key,
    modifiers: common.modifiers.hyper,
  },
  to: [
    {
      shell_command: "osascript -e 'tell application \"%s\" to activate'" % app,
    },
  ],
  type: 'basic',
};

{
  description: 'application shortcuts',
  manipulators: [
    shortcut('a', 'Firefox'),
    shortcut('d', 'wezterm'),
  ],
}
