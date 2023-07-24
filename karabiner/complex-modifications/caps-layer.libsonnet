local common = import 'common.libsonnet';

// delete word back - w
// move word backward - n
// move word forward - d
// @
// ^
// \
// |
// home - a
// end - e
// delete entire line backward - u
// windowing shortcuts
local mapping = {
  // w: [['delete_or_backspace', ['left_option']], ['w', ['left_control']]],
  j: ['left_arrow', []],
  k: ['down_arrow', []],
  l: ['right_arrow', []],
  i: ['up_arrow', []],
  m: ['return_or_enter', []],
};
// local mapping2 = [
//   [
//     'w',
//     [
//       ['delete_or_backspace', ['left_option']],
//       ['w', ['left_control']],
//     ],
//   ],
// ];

{
  description: 'caps layer',
  manipulators: common.generate_layer('caps', 'caps_lock')(mapping),
}
