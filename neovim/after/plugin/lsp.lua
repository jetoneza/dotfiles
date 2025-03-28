local neodev = require('neodev')

-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
neodev.setup({
    -- add any options here, or leave empty to use the default settings
})

local lsp = require("lsp-zero")

lsp.preset("recommended")

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<cr>'] = cmp.mapping.confirm({select = true}),
    ["<C-Space>"] = cmp.mapping.complete()
})

lsp.setup_nvim_cmp({mapping = cmp_mappings})

lsp.on_attach(function(_, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",
                   function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd",
                   function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
                   opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
                   opts)
    vim.keymap
        .set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
                   opts)
end)

lsp.setup()

require("mason-lspconfig").setup {
    handlers = {
        lua_ls = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
                settings = {
                    Lua = {
                        -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        diagnostics = { disable = { 'missing-fields' } },
                    }
                }
            }

            lspconfig.jdtls.setup{}
        end
    }
}

vim.diagnostic.config({virtual_text = true})
