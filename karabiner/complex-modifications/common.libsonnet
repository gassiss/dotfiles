local noop = ['vk_none', []];

local noop_mapping = {
  grave_accent_and_tilde: noop,
  '1': noop,
  '2': noop,
  '3': noop,
  '4': noop,
  '5': noop,
  '6': noop,
  '7': noop,
  '8': noop,
  '9': noop,
  '0': noop,
  hyphen: noop,
  equal_sign: noop,

  tab: noop,
  q: noop,
  w: noop,
  e: noop,
  r: noop,
  t: noop,
  y: noop,
  u: noop,
  i: noop,
  o: noop,
  p: noop,
  open_bracket: noop,
  close_bracket: noop,
  backslash: noop,

  caps_lock: noop,
  a: noop,
  s: noop,
  d: noop,
  f: noop,
  g: noop,
  h: noop,
  j: noop,
  k: noop,
  l: noop,
  semicolon: noop,
  quote: noop,
  return_or_enter: noop,

  left_shift: noop,
  z: noop,
  x: noop,
  c: noop,
  v: noop,
  b: noop,
  n: noop,
  m: noop,
  comma: noop,
  period: noop,
  slash: noop,
  right_shift: noop,
};

{
  generate_layer(varname, keycode): function(mapping)
    local merged_mapping = noop_mapping + mapping;

    [
      {
        type: 'basic',
        from: {
          key_code: keycode,
          modifiers: {
            optional: [
              'caps_lock',
            ],
          },
        },
        to: [
          {
            set_variable: {
              name: varname,
              value: 1,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: keycode,
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: varname,
              value: 0,
            },
          },
        ],
      },
    ] + std.map(function(from) {
      type: 'basic',
      from: {
        key_code: from,
        modifiers: {
          optional: [
            'caps_lock',
          ],
        },
      },
      to: [
        {
          key_code: merged_mapping[from][0],
          modifiers: merged_mapping[from][1],
        },
      ],
      conditions: [
        {
          type: 'variable_if',
          name: varname,
          value: 1,
        },
      ],
    }, std.objectFields(merged_mapping)),

  keycode(kc, mods=[]): { key_code: kc, modifiers: mods },
  cmd(cmd): { shell_command: cmd },

  // for use with dual purpose keys
  generate_simlayer(varname, keycode): function(from_kc, to) [
    {
      type: 'basic',
      from: {
        key_code: from_kc,
        modifiers: {
          optional: [
            'any',
          ],
        },
      },
      to: [
        to,
      ],
      conditions: [
        {
          type: 'variable_if',
          name: varname,
          value: 1,
        },
      ],
    },
    {
      type: 'basic',
      from: {
        simultaneous: [
          {
            key_code: keycode,
          },
          {
            key_code: from_kc,
          },
        ],
        simultaneous_options: {
          key_down_order: 'strict',
          key_up_order: 'strict_inverse',
          detect_key_down_uninterruptedly: true,
          to_after_key_up: [
            {
              set_variable: {
                name: varname,
                value: 0,
              },
            },
          ],
        },
        modifiers: {
          optional: [
            'any',
          ],
        },
      },
      to: [
        {
          set_variable: {
            name: varname,
            value: 1,
          },
        },
        to,
      ],
    },
  ],


  modifiers:: {
    any: { optional: ['any'] },
    hyper: {
      mandatory: [
        'left_shift',
        'left_command',
        'left_control',
        'left_option',
      ],
    },
  },
}
