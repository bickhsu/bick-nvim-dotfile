return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    local neoscroll = require("neoscroll")

    neoscroll.setup({
      hide_cursor = true,
      easing = "quadratic", -- 預設動畫曲線
      mappings = {},        -- 不使用內建快捷鍵，我們自訂
    })

    -- 建立自訂鍵對應表
    local keymap = {
      -- 一行滾動（Ctrl + ↑/↓）
      ["<C-Up>"] = function()
        neoscroll.scroll(-0.25, { move_cursor = true, duration = 80 })
      end,
      ["<C-Down>"] = function()
        neoscroll.scroll(0.25, { move_cursor = true, duration = 80 })
      end,

      -- 半頁滾動（Shift + ↑/↓）
      ["<S-Up>"] = function()
        neoscroll.scroll(-0.7, { move_cursor = true, duration = 150 })
      end,
      ["<S-Down>"] = function()
        neoscroll.scroll(0.7, { move_cursor = true, duration = 150 })
      end,
    }

    -- 啟用在 Normal / Visual / Select 模式
    local modes = { "n", "v", "x" }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func, { silent = true, desc = "Smooth scroll" })
    end
  end,
}

