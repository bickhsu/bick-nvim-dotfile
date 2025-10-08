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
set("n", "<leader>t", "<Cmd>split<CR><Cmd>terminal<CR>", { desc = "Terminal" }) 
set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })
set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "按esc清除highlight" })

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

-- Visual 模式下用 Tab / Shift-Tab 控制縮排
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Indent right" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Indent left" })


