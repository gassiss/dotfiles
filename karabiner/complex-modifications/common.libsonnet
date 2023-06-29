local noop_mapping = {
  grave_accent_and_tilde: 'vk_none',
  '1': 'vk_none',
  '2': 'vk_none',
  '3': 'vk_none',
  '4': 'vk_none',
  '5': 'vk_none',
  '6': 'vk_none',
  '7': 'vk_none',
  '8': 'vk_none',
  '9': 'vk_none',
  '0': 'vk_none',
  hyphen: 'vk_none',
  equal_sign: 'vk_none',

  tab: 'vk_none',
  q: 'vk_none',
  w: 'vk_none',
  e: 'vk_none',
  r: 'vk_none',
  t: 'vk_none',
  y: 'vk_none',
  u: 'vk_none',
  i: 'vk_none',
  o: 'vk_none',
  p: 'vk_none',
  open_bracket: 'vk_none',
  close_bracket: 'vk_none',
  backslash: 'vk_none',

  caps_lock: 'vk_none',
  a: 'vk_none',
  s: 'vk_none',
  d: 'vk_none',
  f: 'vk_none',
  g: 'vk_none',
  h: 'vk_none',
  j: 'vk_none',
  k: 'vk_none',
  l: 'vk_none',
  semicolon: 'vk_none',
  quote: 'vk_none',
  return_or_enter: 'vk_none',

  left_shift: 'vk_none',
  z: 'vk_none',
  x: 'vk_none',
  c: 'vk_none',
  v: 'vk_none',
  b: 'vk_none',
  n: 'vk_none',
  m: 'vk_none',
  comma: 'vk_none',
  period: 'vk_none',
  slash: 'vk_none',
  right_shift: 'vk_none',
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
          key_code: merged_mapping[from],
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

  // for use with dual purpose keys
  generate_simlayer(varname, keycode): function(from_kc, to_kc) [
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
        {
          key_code: to_kc,
          modifiers: [

          ],
        },
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
        {
          key_code: to_kc,
          modifiers: [

          ],
        },
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
