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
    local action_state = require("telescope.actions.state")
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(_, map)
            map({ "n", "i" }, "<C-d>", function(prompt_bufnr)
              local curr_picker = action_state.get_current_picker(prompt_bufnr)

              curr_picker:delete_selection(function(selection)
                harpoon:list():removeAt(selection.index)
              end)
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
    { "<leader>ht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle quick menu" },
  },
}
