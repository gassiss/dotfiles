local complex_modifications = import 'complex-modifications/complex-modifications.libsonnet';
local devices = import 'devices.libsonnet';
local global = import 'global-config.libsonnet';
local shared_profile = import 'shared_profile.libsonnet';

{
  global: global.global,
  profiles: [
    shared_profile {
      complex_modifications: complex_modifications {
        rules: [
          // complex_modifications.mods.ctrl_qwerty,
          complex_modifications.mods.ctrl_layer,
          complex_modifications.mods.numpad_layer,
          complex_modifications.mods.shortcuts,
          complex_modifications.mods.caps_layer,
          complex_modifications.mods.dvorak,
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
        ],
      },
      name: 'Default profile',
      selected: true,
    },
    shared_profile {
      name: 'external',
      complex_modifications: complex_modifications {
        rules: [
          complex_modifications.mods.ctrl_qwerty,
          // complex_modifications.mods.bspc_shift,
        ],
      },
      // devices: std.map(function(device) device {
      //   simple_modifications+:
      //     if device.identifiers.product_id == 834 && device.identifiers.is_keyboard then [{ from: { key_code: 'right_command' }, to: [{ key_code: 'delete_or_backspace' }] }] else [],
      //
      // }, devices.devices),
    },
  ],
}
