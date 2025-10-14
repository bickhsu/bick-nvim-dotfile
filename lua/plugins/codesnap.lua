return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  lazy = false,
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
    bg_x_padding = 50,
    bg_y_padding = 40,
  },
}
