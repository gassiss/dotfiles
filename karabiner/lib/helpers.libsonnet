local mods = {
  none: [],
  sft: ['left_shift'],
  ctl: ['left_control'],
  opt: ['left_option'],
  cmd: ['left_command'],
  any: ['any'],
  hyper: [
    'left_shift',
    'left_command',
    'left_control',
    'left_option',
  ],
};

local from(key_code, mods=[]) = {
  type: 'basic',
  from: {
    key_code: key_code,
    modifiers: {
      optional: ['left_shift'],
      mandatory: mods,
    },
  },
};

local fromCtl(key_code) = from(key_code, mods.ctl);
local fromCmd(key_code) = from(key_code, mods.cmd);
local fromOpt(key_code) = from(key_code, mods.cmd);
local fromHpr(key_code) = from(key_code, mods.hyper);

local to_tap_hold(tap, hold) = {
  to_if_alone: tap,
  to_if_held_down: hold,
};

local kc(key_code, mods=null) = {
  key_code: key_code,
} + if mods == null then {} else { modifiers: mods };

local ctl(key_code) = kc(key_code, mods.ctl);
local cmd(key_code) = kc(key_code, mods.cmd);
local opt(key_code) = kc(key_code, mods.opt);

local set_var(name, val) = {
  set_variable: {
    name: name,
    value: val,
  },
};

local shell_cmd(cmd) = {
  shell_command: if std.isArray(cmd) then std.join('; ', cmd) else cmd,
};

local var_is_set(var) = { type: 'variable_if', name: var, value: 1 };

local front_app_is(app) = {
  type: 'frontmost_application_if',
  bundle_identifiers: app,
};

local front_app_is_not(app) = {
  type: 'frontmost_application_unless',
  bundle_identifiers: app,
};

local open(app) = 'open -a "%s.app"' % app;

local keystroke(key, mod='') =
  "osascript -e 'tell application \"System Events\" to keystroke \"%s\"%s'" %
  [
    key,
    if mod != '' then ' using {%s down}' % mod else '',
  ]
;

local simlayer(keycode) =
  local varname = 'simlayer_' + keycode;

  local sim_options = {
    key_down_order: 'strict',
    key_up_order: 'strict_inverse',
    detect_key_down_uninterruptedly: true,
    to_after_key_up: [set_var(varname, 0)],
  };

  function(from_kc, to) [
    from(from_kc) { to: [to], conditions: [var_is_set(varname)] },
    {
      type: 'basic',
      from: {
        simultaneous: [kc(keycode), kc(from_kc)],
        simultaneous_options: sim_options,
        modifiers: { optional: mods.any },
      },
      to: [set_var(varname, 1), to],
    },
  ];

local layer(keycode, options={}) =
  local varname = 'layer_' + keycode;
  local to_if_alone = if std.objectHas(options, 'override_to_if_alone') then options.override_to_if_alone else kc(keycode);

  {
    key: from(keycode) {
      to: [set_var(varname, 1)],
      to_if_alone: to_if_alone,
      to_after_key_up: [set_var(varname, 0)],
    },
    map(from_kc): from(from_kc) {
      conditions: [var_is_set(varname)],
    },
  };

{
  from: from,
  fromCtl: fromCtl,
  fromCmd: fromCmd,
  fromOpt: fromOpt,
  fromHpr: fromHpr,
  to_tap_hold: to_tap_hold,
  kc: kc,
  ctl: ctl,
  cmd: cmd,
  opt: opt,
  set_var: set_var,
  var_is_set: var_is_set,
  front_app_is: front_app_is,
  front_app_is_not: front_app_is_not,
  shell_cmd: shell_cmd,
  open: open,
  keystroke: keystroke,
  layer: layer,
  simlayer: simlayer,
  mods: mods,
}
