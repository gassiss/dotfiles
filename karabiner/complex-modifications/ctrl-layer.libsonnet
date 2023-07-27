local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  from = h.from,
  kc = h.kc,
  front_app_is = h.front_app_is,
  front_app_is_not = h.front_app_is_not;

{
  description: 'ctrl layer',
  manipulators: [
    from('d', h.mods.ctl) { to: kc(c.keys.del), },
    from('f', h.mods.ctl) { to: kc(c.keys.right, c.mods.opt), },
    from('b', h.mods.ctl) { to: kc(c.keys.left, c.mods.opt), },
    from('w', h.mods.ctl) { to: kc(c.keys.bspc, c.mods.opt), },
    from('h', h.mods.ctl) { to: kc(c.keys.bspc), },
    from('m', h.mods.ctl) { to: kc(c.keys.enter), },
    from('u', h.mods.ctl) { to: kc(c.keys.bspc, c.mods.cmd), },
    from('i', h.mods.ctl) { to: kc(c.keys.tab), },
    from('z', h.mods.ctl) { to: kc('z', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('x', h.mods.ctl) { to: kc('x', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('c', h.mods.ctl) { to: kc('c', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('v', h.mods.ctl) { to: kc('v', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('l', h.mods.ctl) { to: kc('l', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('r', h.mods.ctl) { to: kc('r', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from('t', h.mods.ctl) { to: kc('t', c.mods.cmd), conditions: [front_app_is_not(c.apps.wezterm)] },
    from(c.keys.tab, h.mods.ctl) { to: kc(c.keys.tab, c.keys.cmd) },
    from(c.keys.tab, h.mods.cmd) { to: kc(c.keys.tab, c.keys.ctl) },
  ],
}
