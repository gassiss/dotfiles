require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "go", "typescript", "javascript", "vim", "yaml", "scss", "python", "dockerfile", "c" },
    sync_install = false,

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
