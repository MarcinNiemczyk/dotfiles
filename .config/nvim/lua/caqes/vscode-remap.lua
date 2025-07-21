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
end)
