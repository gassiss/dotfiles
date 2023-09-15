status is-interactive || exit

set --global _hydro_git _hydro_git_$fish_pid

function $_hydro_git --on-variable $_hydro_git
    commandline --function repaint
end

function _hydro_pwd --on-variable PWD --on-variable hydro_ignored_git_paths --on-variable fish_prompt_pwd_dir_length
    set --local git_root (command git --no-optional-locks rev-parse --show-toplevel 2>/dev/null)
    set --local git_base (string replace --all --regex -- "^.*/" "" "$git_root")
    set --local path_sep /

    test "$fish_prompt_pwd_dir_length" = 0 && set path_sep

    if set --query git_root[1] && ! contains -- $git_root $hydro_ignored_git_paths
        set --erase _hydro_skip_git_prompt
    else
        set --global _hydro_skip_git_prompt
    end

    set --global _hydro_pwd (
        string replace --ignore-case -- ~ \~ $PWD |
        string replace -- "/$git_base/" /:/ |
        string replace --regex --all -- "(\.?[^/]{"(
            string replace --regex --all -- '^$' 1 "$fish_prompt_pwd_dir_length"
        )"})[^/]*/" "\$1$path_sep" |
        string replace -- : "$git_base" |
        string replace --regex -- '([^/]+)$' "\x1b[1m\$1\x1b[22m" |
        string replace --regex --all -- '(?!^/$)/|^$' "\x1b[2m/\x1b[22m"
    )
end

function _hydro_postexec --on-event fish_postexec
    set --local last_status $pipestatus
    set --global _hydro_status "$_hydro_newline$_hydro_color_prompt$hydro_symbol_prompt"

    for code in $last_status
        if test $code -ne 0
            set --global _hydro_status "$_hydro_color_error| "(echo $last_status)" $_hydro_newline$_hydro_color_prompt$_hydro_color_error$hydro_symbol_prompt"
            break
        end
    end
end

function _hydro_prompt --on-event fish_prompt
    set --query _hydro_status || set --global _hydro_status "$_hydro_color_prompt$hydro_symbol_prompt"
    set --query _hydro_pwd || _hydro_pwd

    command kill $_hydro_last_pid 2>/dev/null

    set --query _hydro_skip_git_prompt && set $_hydro_git && return

    fish --private --command "
        set branch (
            command git symbolic-ref --short HEAD 2>/dev/null ||
            command git describe --tags --exact-match HEAD 2>/dev/null ||
            command git rev-parse --short HEAD 2>/dev/null |
                string replace --regex -- '(.+)' '@\$1'
        )

        test -z \"\$$_hydro_git\" && set --universal $_hydro_git \"\$branch \"

        for fetch in $hydro_fetch false
            command git rev-list --count --left-right @{upstream}...@ 2>/dev/null |
                read behind ahead

            switch \"\$behind \$ahead\"
                case \" \" \"0 0\"
                case \"0 *\"
                    set upstream \" $hydro_symbol_git_ahead\"
                case \"* 0\"
                    set upstream \" $hydro_symbol_git_behind\"
                case \*
                    set upstream \" $hydro_symbol_git_ahead $hydro_symbol_git_behind\"
            end

            set --universal $_hydro_git \"\$branch\$info\$upstream \"

            test \$fetch = true && command git fetch --no-tags 2>/dev/null
        end
    " &

    set --global _hydro_last_pid (jobs --last --pid)
end

function _hydro_fish_exit --on-event fish_exit
    set --erase $_hydro_git
end

set --global hydro_color_normal (set_color normal)

for color in hydro_color_{pwd,git,error,prompt,duration}
    function $color --on-variable $color --inherit-variable color
        set --query $color && set --global _$color (set_color $$color)
    end && $color
end

set --query hydro_color_error || set --global hydro_color_error $fish_color_error
set --query hydro_symbol_prompt || set --global hydro_symbol_prompt ❱
set --query hydro_symbol_git_ahead || set --global hydro_symbol_git_ahead ↑
set --query hydro_symbol_git_behind || set --global hydro_symbol_git_behind ↓