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
                TabLine = { fg = "#d48e9e" },
            },
        })

        vim.cmd.colorscheme("cyberdream")

        vim.cmd [[highlight BufferLineFill guibg=none]]
        vim.cmd [[highlight BufferLineBackground guifg=#696969 guibg=none]]
        vim.cmd [[highlight BufferLineBufferSelected guifg=#d48e9e guibg=none gui=bold]]
        vim.cmd [[highlight BufferLineSeparatorSelected guifg=#acf76a guibg=none]]
        vim.cmd [[highlight BufferLineModifiedSelected guifg=#acf76a guibg=none gui=bold]]
    end,
}
