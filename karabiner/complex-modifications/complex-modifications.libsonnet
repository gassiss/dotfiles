local ctrl_and_cmd_switch = import 'ctrl-and-cmd-switch.libsonnet';
local hyper = import 'hyper.libsonnet';
local app_shortcuts = import 'app-shortcuts.libsonnet';
local ctrl_qwerty = import 'ctrl-qwerty.libsonnet';

{
  modifiers:: {
    any: { optional: ['any'] },
  },
  // complex modifications:
  // command be ctrl in wezterm. default everywhere else
  // ctrl be command in wezterm
  // ctrl tab in wezterm be command tab
  // have ctrl use qwerty keys instead of dvorak
  // caps to be hyper
  // command bpsc to be option bpsc (delete word)
  // ctrl bspc to be ctrl-w in wezterm (delete word)
  parameters: {
    'basic.simultaneous_threshold_milliseconds': 50,
    'basic.to_delayed_action_delay_milliseconds': 500,
    'basic.to_if_alone_timeout_milliseconds': 1000,
    'basic.to_if_held_down_threshold_milliseconds': 100,
    'mouse_motion_to_scroll.speed': 100,
  },
  rules: [
    ctrl_and_cmd_switch,
    hyper,
    app_shortcuts,
    ctrl_qwerty,
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
      ],
    },
    {
      manipulators: [
        {
          description: 'Change lsft to tab/meh.',
          from: {
            key_code: 'left_shift',
            modifiers: {
              optional: [
                'any',
              ],
            },
          },
          to: [
            {
              key_code: 'left_shift',
              modifiers: [
                'left_command',
                'left_option',
              ],
            },
          ],
          type: 'basic',
        },
      ],
    },
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
      ],
    },
    {
      description: 'numpadt',
      manipulators: [
        {
          from: {
            key_code: 'm',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_1',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'comma',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_2',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'period',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_3',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_4',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_5',
            },
          ],
          type: 'basic',
        },
        {
          from: {
            key_code: 'l',
            modifiers: {
              mandatory: [
                'left_shift',
                'left_command',
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_6',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_7',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_8',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_9',
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
                'left_option',
              ],
            },
          },
          to: [
            {
              key_code: 'keypad_0',
            },
          ],
          type: 'basic',
        },
      ],
    },
    {
      description: 'test',
      manipulators: [
        {
          from: {
            key_code: 'w',
            modifiers: {
              mandatory: [
                'left_control',
              ],
            },
          },
          to: [
            {
              key_code: 'comma',
              modifiers: [
                'left_control',
              ],
            },
          ],
          type: 'basic',
        },
      ],
    },
  ],
}
