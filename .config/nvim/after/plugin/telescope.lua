if vim.g.vscode then
    local vscode = require('vscode')
    vim.keymap.set('n', '<leader>pf', function()
        vscode.action('workbench.action.quickOpen')
    end)
    vim.keymap.set('n', '<leader>ps', function()
        vscode.action('workbench.action.findInFiles')
    end)
else
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end)
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
end
