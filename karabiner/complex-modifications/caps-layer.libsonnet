local common = import 'common.libsonnet';

local mapping = {
  j: ['left_arrow', []],
  k: ['down_arrow', []],
  l: ['right_arrow', []],
  i: ['up_arrow', []],
  m: ['return_or_enter', []],
};

{
  description: 'caps layer',
  manipulators: common.generate_layer('caps', 'caps_lock')(mapping),
}
