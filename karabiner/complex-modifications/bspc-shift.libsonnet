local common = import 'common.libsonnet';

local map = common.generate_simlayer('bspc', 'l');
// local map2 = common.generate_simlayer('bspct', 's');

{
  description: 'Right command as backspace/shift',
  manipulators: [],
  //   map('a', common.keycode('a', ['left_shift'])) +
  //   map('s', common.keycode('s', ['left_shift'])) +
  //   map('d', common.keycode('d', ['left_shift'])) +
  //   map('f', common.keycode('f', ['left_shift'])) +
  //   map('g', common.keycode('g', ['left_shift'])) +
  //   map('q', common.keycode('q', ['left_shift'])) +
  //   map('w', common.keycode('w', ['left_shift'])) +
  //   map('e', common.keycode('e', ['left_shift'])) +
  //   map('r', common.keycode('r', ['left_shift'])) +
  //   map('t', common.keycode('t', ['left_shift'])) +
  //   map('z', common.keycode('z', ['left_shift'])) +
  //   map('x', common.keycode('x', ['left_shift'])) +
  //   map('c', common.keycode('c', ['left_shift'])) +
  //   map('v', common.keycode('v', ['left_shift'])) +
  //   map('b', common.keycode('b', ['left_shift'])) +
  //
  //   map2('y', common.keycode('y', ['left_shift'])) +
  //   map2('u', common.keycode('u', ['left_shift'])) +
  //   map2('i', common.keycode('i', ['left_shift'])) +
  //   map2('o', common.keycode('o', ['left_shift'])) +
  //   map2('p', common.keycode('p', ['left_shift'])) +
  //   map2('h', common.keycode('h', ['left_shift'])) +
  //   map2('j', common.keycode('j', ['left_shift'])) +
  //   map2('k', common.keycode('k', ['left_shift'])) +
  //   map2('l', common.keycode('l', ['left_shift'])) +
  //   map2('semicolon', common.keycode('semicolon', ['left_shift'])) +
  //   map2('n', common.keycode('n', ['left_shift'])) +
  //   map2('m', common.keycode('m', ['left_shift'])) +
  //   map2('comma', common.keycode('comma', ['left_shift'])) +
  //   map2('period', common.keycode('period', ['left_shift'])) +
  //   map2('slash', common.keycode('slash', ['left_shift'])),
  // map('d', common.cmd('open -a Firefox')) +
  // map('o', common.cmd('open -a Wezterm')),
}
