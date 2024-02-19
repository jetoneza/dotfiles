local cmp = require('cmp')

cmp.setup {
  sources = {
    { name = "copilot", group_index = 2, priority = 100 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "luasnip", group_index = 2 },
  },
}
