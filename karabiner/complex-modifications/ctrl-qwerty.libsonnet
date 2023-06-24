local remap(from, to) = {
  type: 'basic',
  from: {
    key_code: from,
    modifiers: {
      mandatory: ['left_control'],
    },
  },
  to: [
    {
      key_code: to,
      modifiers: ['left_control'],
    },
  ],
};

{
  description: 'ctrl with qwerty',
  manipulators: [
    // this is confusing because keyboard is on dvorak, and this is key_code remapping
    remap('q', 'x'),
    remap('w', 'comma'),
    remap('e', 'd'),
    remap('r', 'o'),
    remap('t', 'k'),
    remap('y', 't'),
    remap('u', 'f'),
    remap('i', 'g'),
    remap('o', 's'),
    remap('p', 'r'),

    // remap('a', 'a'),
    remap('s', 'semicolon'),
    remap('d', 'h'),
    remap('f', 'y'),
    remap('g', 'u'),
    remap('h', 'j'),
    remap('j', 'c'),
    remap('k', 'v'),
    remap('l', 'p'),
    remap('semicolon', 'q'),

    remap('z', 'slash'),
    remap('x', 'b'),
    remap('c', 'i'),
    remap('v', 'period'),
    remap('b', 'n'),
    remap('n', 'l'),
    // remap('m', 'm'),
    remap('comma', 'w'),
    remap('period', 'e'),
    remap('slash', 'open_bracket'),
  ],
}
