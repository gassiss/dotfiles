local devices = import 'devices.libsonnet';

{
  complex_modifications: error 'must define complex modifications',
  name: error 'must give profile a name',
  selected: false,
  devices: devices.devices,
  fn_function_keys: [
    {
      from: {
        key_code: 'f1',
      },
      to: [
        {
          consumer_key_code: 'display_brightness_decrement',
        },
      ],
    },
    {
      from: {
        key_code: 'f2',
      },
      to: [
        {
          consumer_key_code: 'display_brightness_increment',
        },
      ],
    },
    {
      from: {
        key_code: 'f3',
      },
      to: [
        {
          apple_vendor_keyboard_key_code: 'mission_control',
        },
      ],
    },
    {
      from: {
        key_code: 'f4',
      },
      to: [
        {
          apple_vendor_keyboard_key_code: 'spotlight',
        },
      ],
    },
    {
      from: {
        key_code: 'f5',
      },
      to: [
        {
          consumer_key_code: 'dictation',
        },
      ],
    },
    {
      from: {
        key_code: 'f6',
      },
      to: [
        {
          key_code: 'f6',
        },
      ],
    },
    {
      from: {
        key_code: 'f7',
      },
      to: [
        {
          consumer_key_code: 'rewind',
        },
      ],
    },
    {
      from: {
        key_code: 'f8',
      },
      to: [
        {
          consumer_key_code: 'play_or_pause',
        },
      ],
    },
    {
      from: {
        key_code: 'f9',
      },
      to: [
        {
          consumer_key_code: 'fast_forward',
        },
      ],
    },
    {
      from: {
        key_code: 'f10',
      },
      to: [
        {
          consumer_key_code: 'mute',
        },
      ],
    },
    {
      from: {
        key_code: 'f11',
      },
      to: [
        {
          consumer_key_code: 'volume_decrement',
        },
      ],
    },
    {
      from: {
        key_code: 'f12',
      },
      to: [
        {
          consumer_key_code: 'volume_increment',
        },
      ],
    },
  ],
  parameters: {
    delay_milliseconds_before_open_device: 1000,
  },
  simple_modifications: [],
  virtual_hid_keyboard: {
    country_code: 0,
    indicate_sticky_modifier_keys_state: true,
    mouse_key_xy_scale: 100,
  },
}

