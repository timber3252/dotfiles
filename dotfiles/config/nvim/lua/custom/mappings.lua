---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    -- save & quit
    ["S"] = { ":w <CR>" },
    ["Q"] = { ":q <CR>" },
    ["<C-q>"] = { ":qa <CR>" },

    -- copy till the end of the line
    ["Y"] = { "y$" },

    -- search
    ["<leader><cr>"] = { ":nohlsearch <CR>" },

    -- auto tab to space
    ["<leader>ts"] = { ":%s/\t/  /g" },

    -- fast navigation
    ["J"] = { "5j" },
    ["K"] = { "5k" },
    ["H"] = { "5h" },
    ["L"] = { "5l" },
    ["W"] = { "5w" },
    ["B"] = { "5b" },
    ["E"] = { "5e" },

    -- move up/down without moving the cursor
    ["<C-j>"] = { "5<C-e>" },
    ["<C-k>"] = { "5<C-y>" },
  },
  v = {
    -- auto tab to space
    ["<leader>ts"] = { ":%s/\t/  /g" },
  },
}

-- more keybinds!

return M
