function fish_right_prompt --description "Right prompt"
  echo -e "$(set_color purple)$_rprompt_kubectl$(set_color normal) $_rprompt_user_host"
end
