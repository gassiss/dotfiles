set --global _rprompt_kubectl

function kubectl --wraps _kubectl
    _kubectl $argv

    if test "$_rprompt_kubectl" = "" || test "$argv[1]" = "config" && test "$argv[2]" = "use-context" || test "$argv[2]" = "set-context"
        set -gx _rprompt_kubectl (_kubectl config view --minify -o json | jq '.contexts[] | .name, .context.namespace' | tr -d '\n' | sed "s/\"\"/\//" | tr -d '"')
    end
end

function kclear
    set --erase _rprompt_kubectl
end
