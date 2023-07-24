local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  layer = h.layer,
  kc = h.kc;

local sftl = layer(c.keys.sft);

{
  description: 'numpad layer on left shift',
  manipulators:
    [
      sftl.key,
      sftl.map('n') { to: kc('keypad_0') },
      sftl.map('m') { to: kc('keypad_1') },
      sftl.map('comma') { to: kc('keypad_2') },
      sftl.map('period') { to: kc('keypad_3') },
      sftl.map('j') { to: kc('keypad_4') },
      sftl.map('k') { to: kc('keypad_5') },
      sftl.map('l') { to: kc('keypad_6') },
      sftl.map('u') { to: kc('keypad_7') },
      sftl.map('i') { to: kc('keypad_8') },
      sftl.map('o') { to: kc('keypad_9') },
    ],
}
