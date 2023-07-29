local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  kc = h.kc,
  front_app_is_not = h.front_app_is_not;

{
  description: 'ctrl layer',
  manipulators: [
    h.fromCtl('d') { to: kc(c.keys.del), },
    h.fromCtl('f') { to: h.opt(c.keys.right), },
    h.fromCtl('b') { to: h.opt(c.keys.left), },
    h.fromCtl('w') { to: h.opt(c.keys.bspc), },
    h.fromCtl('h') { to: kc(c.keys.bspc), },
    h.fromCtl('m') { to: kc(c.keys.enter), },
    h.fromCtl('u') { to: h.cmd(c.keys.bspc), },
    h.fromCtl('i') { to: kc(c.keys.tab), },
    h.fromCtl('z') { to: h.cmd('z'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('x') { to: h.cmd('x'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('c') { to: h.cmd('c'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('v') { to: h.cmd('v'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('l') { to: h.cmd('l'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('r') { to: h.cmd('r'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl('t') { to: h.cmd('t'), conditions: [front_app_is_not(c.apps.wezterm)] },
    h.fromCtl(c.keys.tab) { to: h.cmd(c.keys.tab) },
    h.fromCmd(c.keys.tab) { to: h.ctl(c.keys.tab) },
  ],
}
