return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/playground",
  },

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "json", "toml", "yaml", "python", "cpp", "usd", "lua" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}  
