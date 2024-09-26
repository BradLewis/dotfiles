return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup({})
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local finder = function()
        local paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(paths, item.value)
        end
        return require("telescope.finders").new_table({
          results = paths,
        })
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = finder(),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            map("i", "<C-d>", function()
              local state = require("telescope.actions.state")
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(finder())
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
  keys = {
    { "<leader>hm", "<cmd>lua require('harpoon'):list():add()<cr>", desc = "Mark file with harpoon" },
    { "<leader>hn", "<cmd>lua require('harpoon'):list():next()<cr>", desc = "Go to next harpoon mark" },
    { "<leader>hp", "<cmd>lua require('harpoon'):list():prev()<cr>", desc = "Go to previous harpoon mark" },
    { "]h", "<cmd>lua require('harpoon'):list():next()<cr>", desc = "Go to next harpoon mark" },
    { "[h", "<cmd>lua require('harpoon'):list():prev()<cr>", desc = "Go to previous harpoon mark" },
    { "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle quick menu" },
  },
}
