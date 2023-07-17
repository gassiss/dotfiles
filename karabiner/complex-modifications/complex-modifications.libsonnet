local bspc_shift = import 'bspc-shift.libsonnet';
local ctrl_and_cmd_switch = import 'ctrl-and-cmd-switch.libsonnet';
local ctrl_qwerty = import 'ctrl-qwerty.libsonnet';
local hyper = import 'hyper.libsonnet';
local numpad_layer = import 'numpad-layer.libsonnet';
local shortcuts = import 'shortcuts.libsonnet';

{
  modifiers:: {
    any: { optional: ['any'] },
  },
  mods:: {
    ctrl_qwerty: ctrl_qwerty,
    hyper: hyper,
    ctrl_and_cmd_switch: ctrl_and_cmd_switch,
    numpad_layer: numpad_layer,
    bspc_shift: bspc_shift,
    shortcuts: shortcuts,
  },
  // to implement
  // consistent command bspc: c-w in wezterm, opt-bspc everywhere else
  parameters: {
    'basic.simultaneous_threshold_milliseconds': 250,
    'basic.to_delayed_action_delay_milliseconds': 500,
    'basic.to_if_alone_timeout_milliseconds': 1000,
    'basic.to_if_held_down_threshold_milliseconds': 100,
    'mouse_motion_to_scroll.speed': 100,
  },
  rules: [
    $.mods.ctrl_and_cmd_switch,
    $.mods.hyper,
    $.mods.ctrl_qwerty,
    $.mods.numpad_layer,
    $.mods.shortcuts,
    // only builtin
    {
      manipulators: [
        {
          description: 'Change right command to bspc/lshift',
          from: {
            key_code: 'right_command',
            modifiers: {
              optional: [
                'any',
              ],
            },
          },
          to_if_alone: [
            {
              key_code: 'delete_or_backspace',
            },
          ],
          to_if_held_down: [
            {
              key_code: 'left_shift',
            },
          ],
          type: 'basic',
        },
        {
          description: 'Dual key 9/hyper',
          from: {
            key_code: '9',
            modifiers: {
              optional: [
                'any',
              ],
            },
          },
          to_if_alone: [
            {
              key_code: '9',
            },
          ],
          to_if_held_down: [
            {
              key_code: 'left_shift',
              modifiers: [
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          ],
          type: 'basic',
        },
        {
          description: 'Dual key 2/option',
          from: {
            key_code: '2',
            modifiers: {
              optional: [
                'any',
              ],
            },
          },
          to_if_alone: [
            {
              key_code: '2',
            },
          ],
          to_if_held_down: [
            {
              key_code: 'left_option',
            },
          ],
          type: 'basic',
        },
        {
          description: 'Dual key 0/option',
          from: {
            key_code: '0',
            modifiers: {
              optional: [
                'any',
              ],
            },
          },
          to_if_alone: [
            {
              key_code: '0',
            },
          ],
          to_if_held_down: [
            {
              key_code: 'left_option',
            },
          ],
          type: 'basic',
        },
      ],
    },
    // only builtin. Replace to work with actual layer through variables
    {
      description: 'movement',
      manipulators: [
        {
          from: {
            key_code: 'l',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'right_arrow',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'k',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'down_arrow',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'j',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'left_arrow',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'i',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'up_arrow',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'u',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'home',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'o',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'end',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'n',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_control',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'return_or_enter',
            },
          ],
          type: 'basic',
        },
      ],
    },
  ],
}
