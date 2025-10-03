return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/playground",
  },

  config = function()
    vim.filetype.add({
      extension = {
        kit = "toml",   -- 讓 .kit 檔案吃 toml parser
      },
    })

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "json", "toml", "yaml", "python", "cpp", "usd", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}  
