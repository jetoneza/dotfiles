function ApplyTheme(color)
    color = color or "catppuccin-macchiato"
    vim.cmd.colorscheme(color)
end

ApplyTheme()
