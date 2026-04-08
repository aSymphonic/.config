return {
  -- Telescope (Fuzzy Finder & Grep)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    keys = {
      { '<leader> ', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
      { '<leader>/', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep (Global Search)' },
    },
    config = function()
      require('telescope').setup{}
      require('telescope').load_extension('fzf')
    end
  },
  -- Harpoon (The "Hooks" for your favorite files)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon Mark" },
      { "<C-e>", function() local h = require("harpoon") h.ui:toggle_quick_menu(h:list()) end, desc = "Harpoon Menu" },
      { "<C-h>", function() require("harpoon"):list():select(1) end },
      { "<C-j>", function() require("harpoon"):list():select(2) end },
      { "<C-k>", function() require("harpoon"):list():select(3) end },
      { "<C-l>", function() require("harpoon"):list():select(4) end },
    }
  }
}
