function ApplyTheme(color)
    color = color or "catppuccin-macchiato"
    vim.cmd.colorscheme(color)

    -- Uncomment to make bg transparent
    -- vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

ApplyTheme()
