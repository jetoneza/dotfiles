require('mason').setup()
require('mason-lspconfig').setup()

local cmp = require('cmp')
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<C-Space>"] = cmp.mapping.complete(),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})
    }),
    sources = {
        {name = "copilot", group_index = 2, priority = 100},
        {name = "nvim_lsp", group_index = 2}, {name = "path", group_index = 2},
        {name = "luasnip", group_index = 2}
    }
})

local lsp_capabilities = vim.tbl_deep_extend("force", vim.lsp.protocol
                                                 .make_client_capabilities(),
                                             require("cmp_nvim_lsp").default_capabilities())

local lsp_attach = function(_, bufnr)
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
end

vim.lsp.config('*', {
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {workingDirectory = {mode = "auto"}}
})

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {border = "rounded"}
})
