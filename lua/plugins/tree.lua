
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    view = {
      width = 20,
    },

    renderer = {
      highlight_opened_files = "name",

      root_folder_label = function(path)
        -- 將家目錄展開成 ~
        local home = vim.fn.expand("~")
        path = path:gsub("^" .. home, "~")

        -- 分割路徑
        local parts = vim.split(path, "/", { plain = true })
        local len = #parts

        -- 若層數太少就直接顯示完整路徑
        if len <= 3 then
          return path
        end

        -- ⚙️ 取最後兩層（確保結尾是實際目錄名稱）
        local tail1 = parts[len]
        local tail2 = parts[len - 1]

        -- 若最後一個是空的（通常表示結尾有 /），往前再取一層
        if tail1 == "" then
          tail1 = parts[len - 1]
          tail2 = parts[len - 2]
        end

        -- 回傳 ~/.../folder1/folder2
        return string.format("~/.../%s/%s", tail2, tail1)
      end,
    },

    update_focused_file = {
      enable = true,
    },

    actions = {
      open_file = {
        quit_on_open = false,
        resize_window = false,
      },
    },
  },
}

