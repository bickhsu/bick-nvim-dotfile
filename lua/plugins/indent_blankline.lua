return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        -- 設定線條顏色與高亮顏色
        vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#7a5d72", nocombine = true })
        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#acf76a", nocombine = true })

        require("ibl").setup({
            indent = {
                char = "▏", -- 最細線條，可改 "┊" 試試看哪個你更喜歡
                highlight = { "IndentBlanklineChar" },
            },
            scope = {
                enabled = true,               -- 開啟當前縮排層高亮
                highlight = { "IndentBlanklineContextChar" },
                show_start = false,
                show_end = false,
            },
        })
    end,
}

