local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "timber3252/auto-dark-mode.nvim",
    init = function (_)
      require("auto-dark-mode").init()
    end,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.g.nvchad_theme = "catppuccin-frappe"
        require("nvchad.utils").replace_word("theme = catppuccin-latte", "theme = catppuccin-frappe")
        require("base46").load_all_highlights()
      end,
      set_light_mode = function()
        vim.g.nvchad_theme = "catppuccin-latte"
        require("nvchad.utils").replace_word("theme = catppuccin-frappe", "theme = catppuccin-latte")
        require("base46").load_all_highlights()
      end,
    }
  },

  { import = "custom.configs.user.md-preview" },
}

return plugins
