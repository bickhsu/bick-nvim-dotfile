------------------------------------------------------------
-- Keyboard Mappings
------------------------------------------------------------

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

set("n", "<leader>p", "<Cmd>Lazy<CR>", { desc = "Plugin Manager Window" })
set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Toggle Tree View" })
set("n", "<leader>s", "<Cmd>split<CR>", { desc = "Split Windows" }) 
set("n", "<leader>t", "<Cmd>terminal<CR>", { desc = "Terminal" }) 
set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "按esc清除highlight" })
set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

set("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })

-- Arrow Switch Panel
set("n", "<leader><Left>", "<C-w><Left>")
set("n", "<leader><Down>", "<C-w><Down>")
set("n", "<leader><Up>", "<C-w><Up>")
set("n", "<leader><Right>", "<C-w><Right>")



-- 複製 (Ctrl+C)
set("v", "<C-c>", '"+y')

-- 剪下 (Ctrl+X)
set("v", "<C-x>", '"+d')

-- 貼上 (Ctrl+V)
set("n", "<C-v>", '"+p')
set("i", "<C-v>", '<Esc>"+pa')
set("c", "<C-v>", "<C-r>+")

-- 讓左右鍵在 Insert 模式中可一次跳過整個 tab 空格
vim.keymap.set("i", "<Right>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local ts = vim.bo.tabstop

  -- 如果右邊是空格群，就跳過整個 tab 寬度
  if line:sub(col, col + ts - 2):match("^%s+$") then
    vim.cmd("normal! " .. ts .. "l")
  else
    vim.cmd("normal! l")
  end
end, { noremap = true, silent = true })

vim.keymap.set("i", "<Left>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local ts = vim.bo.tabstop

  -- 如果左邊是空格群，就跳過整個 tab 寬度
  if col > ts and line:sub(col - ts - 1, col - 2):match("^%s+$") then
    vim.cmd("normal! " .. ts .. "h")
  else
    vim.cmd("normal! h")
  end
end, { noremap = true, silent = true })
