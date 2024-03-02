function end-of-line-or-accept-autosuggestion
    set -l line (commandline -L)
    set -l cmd (commandline)
    set -l cursor (commandline -C)
    if test (string length -- $cmd[$line]) = $cursor
        commandline -f accept-autosuggestion
    else
        commandline -f end-of-line
    end
end
