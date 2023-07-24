local ctrl_and_cmd_switch = import 'ctrl-and-cmd-switch.libsonnet';
local ctrl_qwerty = import 'ctrl-qwerty.libsonnet';
local dvorak = import 'dvorak.libsonnet';
local numpad_layer = import 'numpad-layer.libsonnet';
local shortcuts = import 'shortcuts.libsonnet';
local caps_layer = import 'caps-layer.libsonnet';

{
  modifiers:: {
    any: { optional: ['any'] },
  },
  mods:: {
    ctrl_qwerty: ctrl_qwerty,
    ctrl_and_cmd_switch: ctrl_and_cmd_switch,
    numpad_layer: numpad_layer,
    shortcuts: shortcuts,
    caps_layer: caps_layer,
    dvorak: dvorak,
  },
  parameters: {
    'basic.simultaneous_threshold_milliseconds': 250,
    'basic.to_delayed_action_delay_milliseconds': 500,
    'basic.to_if_alone_timeout_milliseconds': 1000,
    'basic.to_if_held_down_threshold_milliseconds': 1,
    'mouse_motion_to_scroll.speed': 100,
  },
  rules: error 'must define rules',
}
