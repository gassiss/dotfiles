if not status is-interactive
    return
end

if not test -e /etc/issue || not test (cat /etc/issue | head -n1 | cut -d ' ' -f1) = "Debian"
    return
end

if test -z (pgrep ssh-agent)
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end


function fd --wraps fdfind
  fdfind $argv
end

function bat --wraps batcat
  batcat $argv
end
