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
    -- 🪄 Tabline Component
    ------------------------------------------------------------
    local tabline_buf_num = {
      provider = function(self)
        return tostring(self.bufnr) .. ". "
      end,
      hl = { fg = "#d48e9e" },
    }

    local tabline_filename = {
      provider = function(self)
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
      end,
      hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
      end,
    }

    local tabline_file_flags = {
      {
        condition = function(self)
          return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
        end,
        provider = "[+]",
        hl = { fg = "green" },
      },
      {
        condition = function(self)
          return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
              or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
        end,
        provider = function(self)
          if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
            return ""
          else
            return ""
          end
        end,
        hl = { fg = "orange" },
      },
    }

    local tabline_filename_block = {
      init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
      end,
      hl = function(self)
        if self.is_active then
          return "TabLineSel"
        else
          return "TabLine"
        end
      end,
      on_click = {
        callback = function(_, minwid, _, button)
          if (button == "m") then
            vim.schedule(function()
              vim.api.nvim_buf_delete(minwid, { force = false })
            end)
          else
            vim.api.nvim_win_set_buf(0, minwid)
          end
        end,
        minwid = function(self)
          return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
      },
      tabline_buf_num,
      FileIcon,
      tabline_filename,
      tabline_file_flags,
    }

    local tabline_close_btn = {
      condition = function(self)
        return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
      end,
      { provider = " " },
      {
        provider = "X",
        hl = { fg = "gray" },
        on_click = {
          callback = function(_, minwid)
            vim.schedule(function()
              vim.api.nvim_buf_delete(minwid, { force = false })
              vim.cmd.redrawtabline()
            end)
          end,
          minwid = function(self)
            return self.bufnr
          end,
          name = "heirline_tabline_close_buffer_callback",
        },
      },
    }

    local tabline_buffer_block = utils.surround({ "", "" }, function(self)
      if self.is_active then
        return utils.get_highlight("TabLineSel").bg
      else
        return utils.get_highlight("TabLine").bg
      end
    end, {
      init = function(self)
        -- 把外層的 bufnr 傳給內層 filename_block
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
      end,
      tabline_buf_num,
      FileIcon,
      tabline_filename,
      tabline_file_flags,
      tabline_close_btn,
    })

    local bufferline = utils.make_buflist(
      tabline_buffer_block,
      { provider = "", hl = { fg = "gray" } },
      { provider = "", hl = { fg = "gray" } }
    )

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


    ------------------------------------------------------------
    -- 🧰 Activate Heirline
    ------------------------------------------------------------
    require("heirline").setup({
      statusline = StatusLine,
      tabline = bufferline,
    })

    vim.o.showtabline = 2 -- always show tabline
    vim.o.laststatus = 3 -- use globle statusline
  end,
}

