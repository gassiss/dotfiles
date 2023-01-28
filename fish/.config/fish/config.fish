if not status is-interactive
    exit
end

set -gx fish_greeting ''

set hydro_color_pwd $fish_color_cwd
set hydro_color_git $fish_color_quote

fzf_configure_bindings --directory=\cf --variables=\e\cv
bind \co __fish_preview_current_file         # c-o
bind \e\[1\;5C nextd-or-forward-word         # c-right
bind \e\[1\;5D prevd-or-backward-word        # c-left
bind \e\[1\;5A history-token-search-backward # c-up
bind \e\[1\;5B history-token-search-forward  # c-down
bind \ch __fish_man_page                     # c-h
bind \e\ce edit_command_buffer               # a-c-e
bind \cg yank-pop                            # c-g
bind \cH backward-kill-word                  # c-h
bind \e\cl __fish_list_current_token         # a-c-l
