return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    -- Playground (選用，可以互動看 AST)
    "nvim-treesitter/playground",

    -- USD Parser (假設你 clone 在 ~/.local/share/nvim/tree-sitter-usd)
    {
      dir = "~/.local/share/nvim/tree-sitter-usd",
    },
  },
  
  config = function()
    -- Filetype override for USD
    vim.filetype.add({
      extension = {
        usd  = "usd",
        usda = "usd",
        usdc = "usd",
      },
    })

    -- 設定 Treesitter
    require("nvim-treesitter.configs").setup({
    ensure_installed = {
      "bash",
      "css",
      "diff",
      "elixir",
      "gitignore",
      "heex",
      "help",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "query",
      "regex",
      "sql",
      "toml",
      "yaml",
      "python",
      "cpp",
      "usd",
      },
    parser_install_dir = vim.fn.expand("~/.local/share/nvim/tree-sitter-usd"),
    highlight = { enable = true },
    indent = { enable = true },
    })

    -- 把 parser 路徑加到 runtime
    vim.opt.runtimepath:append(vim.fn.expand("~/.local/share/nvim/tree-sitter-usd"))
  end,

}
