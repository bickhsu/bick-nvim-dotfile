return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {

    renderer = {
      highlight_opened_files = "name",
    },

    update_focused_file = {
      enable = true,
    },

    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = true,
      },
    },

  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)

    local first_open = true

    vim.api.nvim_create_autocmd("User", {
      pattern = "NvimTreeReady",
      callback = function()
        local api = require("nvim-tree.api")

        api.events.subscribe(api.events.Event.FileOpened, function()
          if first_open then
            require("nvim-tree.config").get().actions.open_file.resize_window = false
            first_open = false
          end
        end)
      end,
    })
  end,
}
