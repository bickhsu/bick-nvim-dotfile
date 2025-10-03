return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 圖示支援，可選

  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",          -- 自動依顏色方案調整
        globalstatus = true,     -- 全域狀態列 (對應 :set laststatus=3)
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } }, -- path=1 表示顯示相對路徑
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},  -- 可以另外加 bufferline / tabline
      extensions = { "quickfix", "fugitive", "nvim-tree" },
    })
  end,
}
