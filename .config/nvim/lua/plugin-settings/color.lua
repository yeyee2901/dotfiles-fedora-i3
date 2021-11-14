local M = {}

-- Dashboard
require('plugin-settings.startify')

-- Lualine
local lualine = require('plugin-settings.lualine')

M.solarized = function ()

  local opts = {
    termguicolors = true,
    solarized_italics = true,
    solarized_visibility = 'normal',
    solarized_diffmode = 'high',
    solarized_termtrans = 0
  }

  for opt, val in ipairs(opts) do
    vim.g[opt] = val
  end

  lualine.setup_lualine('solarized_dark')
  vim.cmd('colorscheme solarized-high')

  vim.cmd("highlight Normal guibg=none")
  vim.cmd("highlight LineNr guibg=none")

  -- Fix tabline highlighting
  vim.cmd("highlight TabLine gui=none guibg=none")
  vim.cmd("highlight TabLineFill gui=none guibg=none")
  vim.cmd("highlight TabLineSel gui=none guibg=none guifg=#dc322f")
  -- vim.cmd("highlight TSFunction guibg=none")
  -- vim.cmd("highlight TSVariable guibg=none")
end

-- Vim colorizer
require('colorizer').setup()

return M
