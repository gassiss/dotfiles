local c = import '../lib/constants.libsonnet';
local h = import '../lib/helpers.libsonnet';
local
  from = h.from,
  kc = h.kc,
  front_app_is = h.front_app_is,
  front_app_is_not = h.front_app_is_not;

{
  description: 'ctrl and command switch in terminal',
  manipulators: [
    from(c.keys.cmd, h.mods.any) { to: kc(c.keys.ctl), conditions: [front_app_is(c.apps.wezterm)] },
    from(c.keys.ctl, h.mods.any) { to: kc(c.keys.cmd), conditions: [front_app_is(c.apps.wezterm)] },
    from(c.keys.tab, h.mods.ctl) { to: kc(c.keys.tab, c.keys.cmd), conditions: [front_app_is(c.apps.wezterm)] },
  ],
}
