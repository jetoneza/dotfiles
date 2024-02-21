local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("grep: ")})
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

require('telescope').setup {
    defaults = {file_ignore_patterns = {"node_modules"}}
}
