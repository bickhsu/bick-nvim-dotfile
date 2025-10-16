return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    vim.opt.termguicolors = true

    require("bufferline").setup({
      options = {
        mode = "buffers",
        style_preset = require("bufferline").style_preset.minimal,
        themable = true,

        diagnostics = "nvim_lsp",
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = false,
        always_show_bufferline = true,

        indicator = { icon = "", style = "icon" },

        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
            separator = true,
          },
        },

        hover = { enabled = true, delay = 200, reveal = { "close" } },

        close_command = function(n)
          require("bufferline").cycle(-1)
          vim.cmd("bdelete! " .. n)
        end,

        -- 🚫 過濾規則
        custom_filter = function(buf_number, buf_numbers)
          local name = vim.fn.bufname(buf_number)
          local filetype = vim.bo[buf_number].filetype

          if name:match("cmd.exe") then
            return false
          end
          if filetype == "terminal" then
            return false
          end

          return true
        end,
      },
    })

    vim.keymap.set("n", ",", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer" })
    vim.keymap.set("n", ".", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", { desc = "Pick Buffer" })
  end,
}

