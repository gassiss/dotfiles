local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  from = h.from,
  kc = h.kc,
  to_tap_hold = h.to_tap_hold;


local hyper = kc(c.keys.sft, c.mods.ctl + c.mods.opt + c.mods.cmd);

{
  description: 'dvorak base layer',
  manipulators: [
    from(c.keys.backtick) {
      from+: { modifiers: { optional: c.mods.caps } },
      to: kc('4', c.mods.sft),
    },
    from('1') {
      from+: { modifiers: { optional: c.mods.caps } },
      to: kc('7', c.mods.sft),
    },
    from('1', c.mods.sft) { to: kc('5', c.mods.sft) },
    from('2') + to_tap_hold(kc(c.keys.open_bracket), kc(c.keys.opt)),
    from('3') + to_tap_hold(kc(c.keys.open_bracket, c.mods.sft), hyper),
    from('4') { to: kc(c.keys.close_bracket, c.mods.sft) },
    from('5') { to: kc('9', c.mods.sft) },
    from('6') { to: kc(c.keys.equal) },
    from('7') { to: kc('8', c.mods.sft) },
    from('8') { to: kc('0', c.mods.sft) },
    from('9') + to_tap_hold(kc(c.keys.equal, c.mods.sft), hyper),
    from('0') + to_tap_hold(kc(c.keys.close_bracket), kc(c.keys.opt)),
    from(c.keys.hyphen) { to: kc('1', c.mods.sft) },
    from(c.keys.equal) {
      from+: { modifiers: { optional: c.mods.caps } },
      to: kc('3', c.mods.sft),
    },
    from(c.keys.equal, c.mods.sft) { to: kc(c.keys.backtick) },

    from('q') { to: kc(c.keys.semicolon) },
    from('w') { to: kc(c.keys.comma) },
    from('e') { to: kc(c.keys.period) },
    from('r') { to: kc('p') },
    from('t') { to: kc('y') },
    from('y') { to: kc('f') },
    from('u') { to: kc('g') },
    from('i') { to: kc('c') },
    from('o') { to: kc('r') },
    from('p') { to: kc('l') },
    from(c.keys.open_bracket) { to: kc(c.keys.slash) },
    from(c.keys.close_bracket) {
      from+: { modifiers: { optional: c.mods.caps } },
      to: kc('2', c.mods.sft),
    },
    from(c.keys.close_bracket, c.mods.sft) { to: kc('6', c.mods.sft) },

    from('a') { to: kc('a') },
    from('s') { to: kc('o') },
    from('d') { to: kc('e') },
    from('f') { to: kc('u') },
    from('g') { to: kc('i') },
    from('h') { to: kc('d') },
    from('j') { to: kc('h') },
    from('k') { to: kc('t') },
    from('l') { to: kc('n') },
    from(c.keys.semicolon) { to: kc('s') },
    from(c.keys.quote) { to: kc(c.keys.hyphen) },

    from('z') { to: kc(c.keys.quote) },
    from('x') { to: kc('q') },
    from('c') { to: kc('j') },
    from('v') { to: kc('k') },
    from('b') { to: kc('x') },
    from('n') { to: kc('b') },
    from('m') { to: kc('m') },
    from(c.keys.comma) { to: kc('w') },
    from(c.keys.period) { to: kc('v') },
    from(c.keys.slash) { to: kc('z') },
  ],
}