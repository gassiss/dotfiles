local common = import 'common.libsonnet';

local map = common.generate_simlayer('bspc', 'delete_or_backspace');

{
  description: 'Right command as backspace/shift',
  manipulators:
    map('q', 'q'),
}
