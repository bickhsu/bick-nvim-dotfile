require("config.lazy")

-- 複製 (Ctrl+C)
vim.keymap.set("v", "<C-c>", '"+y')

-- 剪下 (Ctrl+X)
vim.keymap.set("v", "<C-x>", '"+d')

-- 貼上 (Ctrl+V)
vim.keymap.set("n", "<C-v>", '"+p')
vim.keymap.set("i", "<C-v>", '<Esc>"+pa')
vim.keymap.set("c", "<C-v>", "<C-r>+")
