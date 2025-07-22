local vscode = require('vscode')
do -- Execute _ping asynchronously and print the result
  vscode.action("_ping", {
    callback = function(err, res)
      if err == nil then
        print(res) -- outputs: pong
      end
    end,
  })
end

vim.keymap.set('n', '<leader>ps', function()
    vscode.action('workbench.action.quickOpen')

-- harpoon
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


-- telescope
vim.keymap.set('n', '<leader>pf', function()
    vscode.action('workbench.action.quickOpen')
end)
vim.keymap.set('n', '<leader>ps', function()
    vscode.action('workbench.action.findInFiles')
end)


end)
