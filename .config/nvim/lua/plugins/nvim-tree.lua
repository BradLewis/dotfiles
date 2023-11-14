return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      update_focused_file = {
        enable = true,
      },
    },
    keys = {
      {
        "<leader>e",
        "<cmd>NvimTreeToggle<CR>",
        desc = "Toggle file explorer",
      },
    },
  },
}
