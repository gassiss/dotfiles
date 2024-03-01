function __setup_ssh_config
end

set -gx _rprompt_user_host "$USER@$(hostname)"

function pbcopy
  ssh -t client pbcopy $argv
end

