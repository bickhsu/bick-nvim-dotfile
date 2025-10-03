return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            transparent = true,

            -- Override highlight groups with your own colour values
            highlights = {
                Comment = { fg = "#696969", bg = "NONE", italic = true },
                LineNr = { fg = "#d48e9e" },
                CursorLineNr = { fg = "#a6858b", bold = true },
                Whitespace = { fg = "#a6858b", bg = "NONE" },
            },

        })

        vim.cmd.colorscheme("cyberdream")
    end,
}
