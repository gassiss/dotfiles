function fish_prompt --description "Stolen from jorgebucaran/hydro"
    echo -e "$_hydro_color_pwd$_hydro_pwd$hydro_color_normal $_hydro_color_git$$_hydro_git$hydro_color_normal$_hydro_color_duration$_hydro_status$hydro_color_normal "
end

set -gx hydro_color_pwd green
set -gx hydro_color_git cyan
