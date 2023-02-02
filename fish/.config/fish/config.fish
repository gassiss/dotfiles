if not status is-interactive
    exit
end

set -gx fish_greeting ''
set -gx EDITOR nvim

set hydro_color_pwd $fish_color_cwd
set hydro_color_git $fish_color_quote

abbr g git
abbr gc git commit
abbr gcn git commit --no-verify
abbr gs git status
abbr gp git push
abbr gr git rebase
abbr grc git rebase --continue
abbr gca git rebase --abort
abbr ga git add
abbr gd git diff
abbr gdc git diff --cached

fzf_configure_bindings --directory=\cf --variables=\e\cv
bind \co __fish_preview_current_file         # c-o
bind \e\[1\;5C nextd-or-forward-word         # c-right
bind \e\[1\;5D prevd-or-backward-word        # c-left
bind \e\[1\;5A history-token-search-backward # c-up
bind \e\[1\;5B history-token-search-forward  # c-down
bind \ch __fish_man_page                     # c-h
bind \e\ce edit_command_buffer               # a-c-e
bind \cg yank-pop                            # c-g
#bind \cH backward-kill-word                  # c-h
bind \e\cl __fish_list_current_token         # a-c-l
