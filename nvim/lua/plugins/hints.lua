return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- Only loads when you start pressing keys (super fast)
    opts = {
      -- This controls how long you wait before the popup appears (in ms)
      delay = 500, 
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
      win = {
        border = "rounded", 
    },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (Which-key)",
      },
    },
  }
}
