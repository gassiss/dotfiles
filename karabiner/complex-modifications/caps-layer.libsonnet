local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  layer = h.layer,
  kc = h.kc,
  front_app_is = h.front_app_is,
  front_app_is_not = h.front_app_is_not;

// windowing shortcuts

local caps_layer = layer(c.keys.caps, { override_to_if_alone: kc(c.keys.none) });

{
  description: 'caps layer',
  manipulators: [
    caps_layer.key,
    caps_layer.map('w') { to: kc('w', c.mods.ctl), conditions+: [front_app_is(c.apps.wezterm)] },
    caps_layer.map('w') { to: kc(c.keys.bspc, c.mods.opt), conditions+: [front_app_is_not(c.apps.wezterm)] },
    caps_layer.map('a') { to: kc('a', c.mods.ctl) },
    caps_layer.map('e') { to: kc('e', c.mods.ctl) },
    caps_layer.map('d') { to: kc(c.keys.right, c.mods.opt) },
    caps_layer.map('n') { to: kc(c.keys.left, c.mods.opt), conditions+: [front_app_is_not(c.apps.wezterm)] },
    caps_layer.map('n') { to: kc('b', c.mods.opt), conditions+: [front_app_is(c.apps.wezterm)] },
    caps_layer.map('u') { to: kc(c.keys.bspc, c.mods.cmd), conditions+: [front_app_is_not(c.apps.wezterm)] },
    caps_layer.map('u') { to: kc('u', c.mods.ctl), conditions+: [front_app_is(c.apps.wezterm)] },
    caps_layer.map('h') { to: kc(c.keys.bspc) },
    caps_layer.map('j') { to: kc(c.keys.left) },
    caps_layer.map('k') { to: kc(c.keys.down) },
    caps_layer.map('l') { to: kc(c.keys.right) },
    caps_layer.map('i') { to: kc(c.keys.up) },
    caps_layer.map('m') { to: kc(c.keys.enter) },
    caps_layer.map('o') { to: kc('2', c.mods.sft) },
    caps_layer.map(c.keys.open_bracket) { to: kc('6', c.mods.sft) },
    caps_layer.map(c.keys.semicolon) { to: kc(c.keys.backslash, c.mods.sft) },
    caps_layer.map(c.keys.quote) { to: kc(c.keys.backslash) },
  ],
}
