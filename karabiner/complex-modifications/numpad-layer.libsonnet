local common = import 'common.libsonnet';

local mapping = {
  n: ['keypad_0', []],
  m: ['keypad_1', []],
  comma: ['keypad_2', []],
  period: ['keypad_3', []],
  j: ['keypad_4', []],
  k: ['keypad_5', []],
  l: ['keypad_6', []],
  u: ['keypad_7', []],
  i: ['keypad_8', []],
  o: ['keypad_9', []],
  h: ['e', []],
  y: ['q', ['left_shift']],
};

{
  description: 'numpad layer on left shift',
  manipulators:
    common.generate_layer('numpad', 'left_shift')(mapping),
  // map('n', 'keypad_0') +
  // map('m', 'keypad_1') +
  // map('comma', 'keypad_2') +
  // map('period', 'keypad_3') +
  // map('j', 'keypad_4') +
  // map('k', 'keypad_5') +
  // map('l', 'keypad_6') +
  // map('u', 'keypad_7') +
  // map('i', 'keypad_8') +
  // map('o', 'keypad_9'),
}
