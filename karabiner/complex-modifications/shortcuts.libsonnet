local h = import '../lib/helpers.libsonnet';
local
  from = h.from,
  open = h.open,
  keystroke = h.keystroke,
  shell_cmd = h.shell_cmd;
local c = import '../lib/constants.libsonnet';

// local sim_o_and = h.simlayer('o');
// local sim_w_and = h.simlayer('w');
// local sim_i_and = h.simlayer('i');
// local sim_e_and = h.simlayer('e');
{
  description: 'App shortcuts',
  manipulators:
    [
      h.fromHpr('f') + { to: shell_cmd(open('firefox')) },
      h.fromHpr('d') + { to: shell_cmd(open('wezterm')) },
      h.fromHpr('g') + { to: shell_cmd(open('safari')) },
      h.fromHpr('e') + { to: shell_cmd(open('netnewswire')) },
      h.fromHpr('t') + { to: shell_cmd(open('books')) },
      // shortcut('m', [open('firefox'), keystroke('1', 'command')]),
    ],
  // sim_o_and('d', shell_cmd(open('firefox'))) +
  // sim_o_and('s', shell_cmd(open('wezterm'))) +
  // sim_o_and('g', shell_cmd(open('safari'))) +
  // sim_o_and('f', shell_cmd(open('netnewswire'))) +
  // sim_o_and('t', shell_cmd(open('books'))) +
  // sim_o_and('r', h.kc('r', c.mods.hyper)) +
  // sim_w_and('d', shell_cmd(open('firefox'))) +
  // sim_w_and('s', shell_cmd(open('wezterm'))) +
  // sim_w_and('g', shell_cmd(open('safari'))) +
  // sim_w_and('f', shell_cmd(open('netnewswire'))) +
  // sim_w_and('t', shell_cmd(open('books'))) +
  // sim_w_and('r', h.kc('r', c.mods.hyper)) +
  //
  // sim_i_and('q', h.opt('q')) +
  // sim_i_and('w', h.opt('w')) +
  // sim_i_and('e', h.opt('e')) +
  // sim_i_and('r', h.opt('r')) +
  // sim_i_and('t', h.opt('t')) +
  // sim_i_and('a', h.opt('a')) +
  // sim_i_and('s', h.opt('s')) +
  // sim_i_and('d', h.opt('d')) +
  // sim_i_and('f', h.opt('f')) +
  // sim_i_and('g', h.opt('g')),
  // sim_e_and('q', h.opt('q')) +
  // sim_e_and('w', h.opt('w')) +
  // // sim_e_and('e', h.opt('e')) +
  // sim_e_and('r', h.opt('r')) +
  // sim_e_and('t', h.opt('t')) +
  // sim_e_and('a', h.opt('a')) +
  // sim_e_and('s', h.opt('s')) +
  // sim_e_and('d', h.opt('d')) +
  // sim_e_and('f', h.opt('f')) +
  // sim_e_and('g', h.opt('g')),
}
