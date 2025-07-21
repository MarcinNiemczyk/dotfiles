if vim.g.vscode then
    local vscode = require('vscode')
    vim.keymap.set('n', '<leader>a', function()
        vscode.action('vscode-harpoon.addEditor')
    end)
    vim.keymap.set('n', '<C-e>', function()
        vscode.action('vscode-harpoon.editEditors')
    end)
    vim.keymap.set('n', '<C-t>', function()
        vscode.action('vscode-harpoon.gotoEditor1')
    end)
    vim.keymap.set('n', '<C-h>', function()
        vscode.action('vscode-harpoon.gotoEditor2')
    end)
    vim.keymap.set('n', '<C-s>', function()
        vscode.action('vscode-harpoon.gotoEditor3')
    end)
    vim.keymap.set('n', '<C-n>', function()
        vscode.action('vscode-harpoon.gotoEditor4')
    end)
else
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
end
