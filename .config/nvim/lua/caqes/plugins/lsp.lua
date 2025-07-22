return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/mason.nvim'},
        {'williamboman/mason-lspconfig.nvim'},

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},

        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
    },

    config = function()
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = {buffer = bufnr, remap = false}

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "gh", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        -- Mason setup
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {
                'pyright',
                'ts_ls',
                'lua_ls',
            },
            handlers = {
                lsp_zero.default_setup,
            }
        })

        -- Completion setup
        local cmp = require('cmp')

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
                {name = 'luasnip'},
                {name = 'buffer'},
                {name = 'path'},
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item({behavior = cmp.SelectBehavior.Select}),
                ['<C-n>'] = cmp.mapping.select_next_item({behavior = cmp.SelectBehavior.Select}),
                ['<C-y>'] = cmp.mapping.confirm({select = true}),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

        vim.diagnostic.config({
            virtual_text = false,
            underline = false,
        })
    end
}

