return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,

    config = function()

        vim.opt.cursorline = true
        vim.opt.cursorlineopt = "number"

        require("cyberdream").setup({
            transparent = true,
            highlights = {
                Comment = { fg = "#696969", bg = "NONE", italic = true },
                LineNr = { fg = "#d48e9e" },
                CursorLineNr = { fg = "#acf76a", bold = true },
                Whitespace = { fg = "#1a1a1a" },
            },
        })

        vim.cmd.colorscheme("cyberdream")
    end,
}
