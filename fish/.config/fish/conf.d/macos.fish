if not status is-interactive
    return
end

if not test (uname) = "Darwin"
    return
end

set -gxa PATH "/opt/homebrew/bin"
