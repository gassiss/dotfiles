.PHONY: karabiner
karabiner: ~/.config/karabiner/karabiner.json

FILES := $(shell fd -t f -e libsonnet -e jsonnet . './karabiner')
~/.config/karabiner/karabiner.json: $(FILES)
	jsonnet ~/.dotfiles/karabiner/karabiner.jsonnet -o ~/.config/karabiner/karabiner.json
