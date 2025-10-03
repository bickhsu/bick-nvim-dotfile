------------------------------------------------------------
-- Options
------------------------------------------------------------

local indent = 4

-- Interface
vim.opt.number = true
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.termguicolors = true

-- Indentation
vim.opt.expandtab = true       -- Tab 轉成空格
vim.opt.shiftwidth = indent    -- 自動縮排寬度 = 2
vim.opt.smartindent = true     -- 智能縮排（根據語法自動縮排）
vim.opt.softtabstop = indent   -- 按 <Tab> / <BS> 的時候算 2 空格
vim.opt.tabstop = indent       -- Tab 寬度 = 2 空格
vim.opt.list = false
-- 設定要顯示哪些符號
vim.opt.listchars = {
  space = "·",     -- 空格顯示為 ·
  tab = "» ",      -- Tab 顯示為 » 後面帶一個空格
}
-- vim.opt.cursorline = true

-- Search
vim.opt.grepprg = "rg --vimgrep"  -- 用 ripgrep 當 grep 工具
vim.opt.ignorecase = true   
vim.opt.smartcase = true 

-- Completion
vim.opt.completeopt = { "menu", "noselect" }  -- 補全選單顯示但不自動選
vim.opt.pumheight = 10                        -- 補全選單最多顯示 10 行

-- Behavior
vim.opt.clipboard = "unnamedplus"  -- 使用系統剪貼簿（Windows/macOS/Linux）
vim.opt.hidden = true              -- 允許 buffer 切換時不存檔
vim.opt.undofile = true            -- 啟用永久 undo（跨重啟保留編輯歷史）
vim.opt.updatetime = 1000          -- CursorHold / 更新觸發時間 (1s)

