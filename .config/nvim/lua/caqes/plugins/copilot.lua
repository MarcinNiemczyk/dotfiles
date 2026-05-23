return {
    "github/copilot.vim",

    config = function()
        vim.keymap.set('i', '<C-r>', 'copilot#Accept("\\<CR>")', {
          expr = true,
          replace_keycodes = false
        })
        vim.keymap.set('i', '<C-l>', '<Plug>(copilot-accept-line)', {
          desc = 'Copilot accept line'
        })
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_enabled = 1
    end
}
