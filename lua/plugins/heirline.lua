return {
  "rebelot/heirline.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "lewis6991/gitsigns.nvim",
  },

  config = function()
    local utils = require("heirline.utils")
    local conditions = require("heirline.conditions")
    require("gitsigns").setup()

    ------------------------------------------------------------
    -- 🪄 Git Component
    ------------------------------------------------------------
    local Git = {
      condition = conditions.is_git_repo,

      init = function(self)
        local dict = vim.b.gitsigns_status_dict or {}
        self.branch = dict.head or "?"
      end,

      -- branch name
      {
        provider = function(self)
          return " " .. self.branch
        end,

        hl = {  fg = "#d48e9e", bold = true },
      },

    }

    ------------------------------------------------------------
    -- 🧱 Statusline
    ------------------------------------------------------------
    local StatusLine = {
      { provider = "✨ | " },
      Git,
    }

    ------------------------------------------------------------
    -- 🧩 Tabline
    ------------------------------------------------------------
    local TabLine = {
      { provider = "👽|" },
      {
        provider = function()
          return vim.fn.expand("%:t")
        end,
        hl = { fg = "#d48e9e", bold = true },
      }
    }

    ------------------------------------------------------------
    -- 🧰 Activate Heirline
    ------------------------------------------------------------
    require("heirline").setup({
      statusline = StatusLine,
      tabline = TabLine,
    })

    vim.o.showtabline = 2 -- always show tabline
    vim.o.laststatus = 3 -- use globle statusline
  end,
}

