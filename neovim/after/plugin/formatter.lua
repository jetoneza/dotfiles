-- Utilities for creating configurations
local util = require("formatter.util")

-- prettierd formatter
prettierd = {
    function()
        return {
            exe = "prettierd",
            args = {vim.api.nvim_buf_get_name(0)},
            stdin = true
        }
    end
}

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
    -- Enable or disable logging
    logging = true,
    -- Set the log level
    log_level = vim.log.levels.WARN,
    -- All formatter configurations are opt-in
    filetype = {
        javascript = prettierd,
        typescript = prettierd,
        svelte = prettierd,
        lua = {
            function()
                return {
                    exe = "lua-format",
                    args = {
                        util.escape_path(util.get_current_buffer_file_path())
                    },
                    stdin = true
                }
            end
        },
        rust = {
            function()
                return
                    {
                        exe = "rustfmt",
                        args = {"--edition", "2021"},
                        stdin = true
                    }
            end
        },
        -- Use the special "*" filetype for defining formatter configurations on
        -- any filetype
        ["*"] = {
            -- "formatter.filetypes.any" defines default configurations for any
            -- filetype
            require("formatter.filetypes.any").remove_trailing_whitespace
        }
    }
})
