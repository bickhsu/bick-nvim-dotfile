return {
  "krivahtoo/silicon.nvim",
  build = "./install.sh",
  cmd = "Silicon",
  opts = {
    theme = "Dracula",
    background = "#282a36",
    font = "CaskaydiaCove Nerd Font",
    output = "~/Pictures/silicon_{time:%Y-%m-%d-%H-%M-%S}.png",
  },
  keys = {
    { "<leader>ss", "<cmd>Silicon<cr>", mode = "x", desc = "Take code snapshot" },
  },
}

