local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local kc = h.kc;

// windowing shortcuts

local caps_layer = h.layer(c.keys.caps, { override_to_if_alone: kc(c.keys.none) });

{
  description: 'caps layer',
  manipulators: [
    caps_layer.key,
    caps_layer.map('j') { to: kc(c.keys.left) },
    caps_layer.map('k') { to: kc(c.keys.down) },
    caps_layer.map('l') { to: kc(c.keys.right) },
    caps_layer.map('i') { to: kc(c.keys.up) },
    caps_layer.map('m') { to: kc(c.keys.enter) },
    caps_layer.map('o') { to: kc('2', c.mods.sft) },
    caps_layer.map('p') { to: kc(c.keys.backslash, c.mods.sft) },
    caps_layer.map(c.keys.semicolon) { to: kc(c.keys.backslash) },
  ],
}
