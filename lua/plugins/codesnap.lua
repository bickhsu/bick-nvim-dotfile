return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  lazy = false,

  cond = function()
    return vim.loop.os_uname().sysname == "Linux"
  end,

  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  opts = {
    save_path = "~/Pictures",
    has_breadcrumbs = true,  
    has_line_number = false,  
    bg_theme = "grape",     
    code_font_family = "CaskaydiaCove Nerd Font", 
    watermark = "BICK",
    bg_x_padding = 20,
    bg_y_padding = 20,
    bg_color = "#8a8091",
  },
}
