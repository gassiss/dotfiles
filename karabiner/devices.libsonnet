{
  builtin:: {
    product_id: 834,
    vendor_id: 1452,
  },
  devices: [
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: $.builtin {
        is_keyboard: true,
        is_pointing_device: false,
      },
      ignore: false,
      manipulate_caps_lock_led: true,
      simple_modifications: [
        {
          from: {
            key_code: 'left_control',
          },
          to: [
            {
              key_code: 'left_option',
            },
          ],
        },
        {
          from: {
            key_code: 'left_option',
          },
          to: [
            {
              key_code: 'left_control',
            },
          ],
        },
      ],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: $.builtin {
        is_keyboard: false,
        is_pointing_device: true,
      },
      ignore: true,
      manipulate_caps_lock_led: false,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: {
        is_keyboard: true,
        is_pointing_device: false,
        product_id: 50475,
        vendor_id: 1133,
      },
      ignore: false,
      manipulate_caps_lock_led: true,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: {
        is_keyboard: false,
        is_pointing_device: true,
        product_id: 50475,
        vendor_id: 1133,
      },
      ignore: true,
      manipulate_caps_lock_led: false,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: {
        is_keyboard: true,
        is_pointing_device: true,
        product_id: 8705,
        vendor_id: 4617,
      },
      ignore: false,
      manipulate_caps_lock_led: true,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: {
        is_keyboard: false,
        is_pointing_device: true,
        product_id: 8705,
        vendor_id: 4617,
      },
      ignore: true,
      manipulate_caps_lock_led: false,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
  ],
}
