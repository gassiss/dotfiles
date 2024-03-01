if not status is-interactive
    return
end

if not set -q SSH_CLIENT;
    return
end

set -gx _rprompt_user_host "$USER@$(hostname)"

function pbcopy
  ssh -t client pbcopy $argv
end
