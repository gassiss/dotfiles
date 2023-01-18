require("config.general")
require("config.mappings")
require("config.autocmd")
require("config.lazy")

-- missing from old config:
-- dap
--
-- todo:
-- revamp some keybinds
-- * ensure most used (current) ones are either control + key or leader + key
-- * (new) treesitter keybinds
-- * telescope: grep (and find reference if possible) from current dir
-- * learn more about snippets (long effort)
-- * setup dap (long effort)
-- interesting plugins to maybe use:
-- * leap -> allows to reach places with less keystrokes
-- * RRethy/vim-illuminate -> highlights symbols like vscode
-- * folke/trouble.nvim -> cool diagnostics window
-- * nvim-neo-tree/neo-tree.nvim -> replace netwr maybe
-- * vim-surround or mini.surround for easy add/delete '"` tags etc
-- * mini.comment for commenting text (maybe also JoosepAlviste/nvim-ts-context-commentstring need to check)
-- * rcarriga/nvim-notify -> notifications
-- * stevearc/dressing.nvim -> for input and select ui components
-- * lukas-reineke/indent-blankline.nvim -> uses virtual text to highlight indent lines live vscode
-- * SmiteshP/nvim-navic -> shows symbol context in lualine
