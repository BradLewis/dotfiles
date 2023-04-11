local M = {
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  local chatgpt = require("chatgpt")
  chatgpt.setup({})

  local wk = require("which-key")

  wk.register({
    p = {
      name = "ChatGPT",
      c = {
        function()
          chatgpt.openChat()
        end,
        "Chat with ChatGPT",
      },
      a = {
        function()
          chatgpt.selectAwesomePrompt()
        end,
        "ActAs",
      },
      e = {
        function()
          chatgpt.edit_with_instructions()
        end,
        "Edit with instructions",
      },
    },
  }, { prefix = "<leader>" })

  wk.register({
    p = {
      name = "ChatGPT",
      e = {
        function()
          chatgpt.edit_with_instructions()
        end,
        "Edit with instructions",
      },
    },
  }, {
    prefix = "<leader>",
    mode = "v",
  })
end

return M
