local complex_modifications = import 'complex-modifications/complex-modifications.libsonnet';
local devices = import 'devices.libsonnet';
local global = import 'global-config.libsonnet';
local shared_profile = import 'shared_profile.libsonnet';

{
  global: global.global,
  profiles: [
    shared_profile {
      complex_modifications: complex_modifications,
      name: 'Default profile',
      selected: true,
    },
    shared_profile {
      name: 'external',
      complex_modifications: complex_modifications {
        rules: [
          complex_modifications.mods.ctrl_qwerty,
        ],
      },
    },
  ],
}
