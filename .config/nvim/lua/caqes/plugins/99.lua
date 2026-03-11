return {
  "ThePrimeagen/99",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local _99 = require("99")

    _99.setup({
      tmp_dir = "./tmp",
      md_files = { "AGENT.md" },
      completion = {
        source = "native",
      },
    })

    vim.keymap.set("v", "<leader>9v", function()
      _99.visual()
    end, { desc = "99 visual rewrite" })

    vim.keymap.set("n", "<leader>9s", function()
      _99.search()
    end, { desc = "99 project search" })

    vim.keymap.set("n", "<leader>9x", function()
      _99.stop_all_requests()
    end, { desc = "99 stop requests" })

    vim.keymap.set("n", "<leader>9o", function()
      _99.open()
    end, { desc = "99 open last result" })

    vim.keymap.set("n", "<leader>9l", function()
      _99.view_logs()
    end, { desc = "99 view logs" })

    vim.keymap.set("n", "<leader>9c", function()
      _99.clear_previous_requests()
    end, { desc = "99 clear history" })

    vim.keymap.set("n", "<leader>9m", function()
      require("99.extensions.telescope").select_model()
    end, { desc = "99 select model" })

    vim.keymap.set("n", "<leader>9p", function()
      require("99.extensions.telescope").select_provider()
    end, { desc = "99 select provider" })
  end,
}
