return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup()

    -- Ctrl + / 註解切換 (Normal 模式)
    vim.keymap.set("n", "<C-_>", function()
      return vim.v.count == 0 and "gcc" or "gc" .. vim.v.count
    end, { expr = true, remap = true, desc = "Toggle comment (normal mode)" })

    -- Ctrl + / 註解切換 (Visual 模式)
    vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment (visual mode)" })
  end,
}

