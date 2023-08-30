function fish_right_prompt --description "Right prompt"
  echo -e "$_kubectl_color$_rprompt_kubectl$hydro_color_normal $_rprompt_user_host"
end

set -g _kubectl_color (set_color purple)
