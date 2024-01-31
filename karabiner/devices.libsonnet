local c = import './lib/constants.libsonnet';
local h = import './lib/helpers.libsonnet';
local from = h.from, kc = h.kc;

{
  builtin:: c.device_ids.builtin,
  dygma:: c.device_ids.dygma,
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
        from(c.keys.ctl) { to: kc(c.keys.opt) },
        from(c.keys.opt) { to: kc(c.keys.cmd) },
        from(c.keys.cmd) { to: kc(c.keys.ctl) },
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
      ignore: true,
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
      identifiers: $.dygma {
        is_keyboard: true,
        is_pointing_device: true,
      },
      ignore: false,
      manipulate_caps_lock_led: true,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
    {
      disable_built_in_keyboard_if_exists: false,
      fn_function_keys: [],
      identifiers: $.dygma {
        is_keyboard: false,
        is_pointing_device: true,
      },
      ignore: true,
      manipulate_caps_lock_led: false,
      simple_modifications: [],
      treat_as_built_in_keyboard: false,
    },
  ],
}
