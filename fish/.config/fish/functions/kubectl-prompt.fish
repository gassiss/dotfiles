function kubectl-prompt
    if test "$argv[1]" = "enable"
        set -gx _rprompt_kubectl (_kubectl config view --minify -o json | jq '.contexts[] | .name, .context.namespace' | tr -d '\n' | sed "s/\"\"/\//" | tr -d '"')
    else if test "$argv[1]" = "disable"
        set -gx _rprompt_kubectl ""
    else
        echo "bad option"
    end
end
