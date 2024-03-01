if not status is-interactive
    return
end

if not test -e /etc/issue || test (cat /etc/issue | head -n1 | cut -d ' ' -f1) = "Debian"
    return
end

function fd --wraps fdfind
  fdfind $argv
end

function bat --wraps batcat
  batcat $argv
end
