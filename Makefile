.PHONY: karabiner
karabiner: ~/.config/karabiner/karabiner.json

FILES := $(shell fd -t f -e libsonnet -e jsonnet . './karabiner')
~/.config/karabiner/karabiner.json: $(FILES)
	jsonnet \
		--ext-str "BUILTIN_PRODUCT_ID=${BUILTIN_PRODUCT_ID}" \
		--ext-str "BUILTIN_VENDOR_ID=${BUILTIN_VENDOR_ID}" \
		~/.dotfiles/karabiner/karabiner.jsonnet -o ~/.config/karabiner/karabiner.json

karabiner-personal:
	make karabiner BUILTIN_PRODUCT_ID=834 BUILTIN_VENDOR_ID=1452
