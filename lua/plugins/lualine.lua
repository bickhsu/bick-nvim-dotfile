return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 圖示支援，可選

  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "horizon",
        globalstatus = true,     -- :set laststatus=3
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { 
          { function() return "👽👽👽" end },
          { "filename", path = 1 },
        },
        lualine_x = {
          require("codex").status(),
          "encoding",
          "fileformat",
          "filetype",
        },
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
