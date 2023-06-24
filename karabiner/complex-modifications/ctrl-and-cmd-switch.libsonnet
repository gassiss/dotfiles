local common = import 'common.libsonnet';

{
  description: 'ctrl and command switch in terminal',
  manipulators: [
    {
      type: 'basic',
      from: {
        key_code: 'left_command',
        modifiers: common.modifiers.any,
      },
      to: [{
        key_code: 'left_control',
      }],
      conditions: [
        {
          type: 'frontmost_application_if',
          bundle_identifiers: ['com.github.wez.wezterm'],
        },
      ],
    },
    {
      type: 'basic',
      from: {
        key_code: 'left_control',
        modifiers: common.modifiers.any,
      },
      to: [{
        key_code: 'left_command',
      }],
      conditions: [
        {
          type: 'frontmost_application_if',
          bundle_identifiers: ['com.github.wez.wezterm'],
        },
      ],
    },
    {
      type: 'basic',
      from: {
        key_code: 'tab',
        modifiers: {
          mandatory: ['left_control'],
        },
      },
      to: [{
        key_code: 'tab',
        modifiers: ['left_command'],
      }],
      conditions: [
        {
          type: 'frontmost_application_if',
          bundle_identifiers: ['com.github.wez.wezterm'],
        },
      ],
    },
  ],
}
