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

  lualine.setup_lualine('solarized')
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

-- For alternative
M.neo_solarized = function()
  local opts = {
    neosolarized_bold = 1,
    neosolarized_underline = 1,
    neosolarized_italic = 1,
    neosolarized_vertSplitBgTrans = 1,
    neosolarized_visibility = "high",
    neosolarized_termBoldAsBright = 1
  }

  for option, value in ipairs(opts) do
    vim.g[option] = value
  end

  vim.opt.background = "dark"

  lualine.setup_lualine('solarized')
  vim.cmd('colorscheme NeoSolarized')

  -- so my eyes don't hurt!
  vim.cmd('highlight CmpItemKind guifg=#839496')

  vim.cmd("highlight Normal guibg=none")
  vim.cmd("highlight LineNr guibg=none")

  -- Fix tabline highlighting
  vim.cmd("highlight TabLine gui=none guibg=none")
  vim.cmd("highlight TabLineFill gui=none guibg=none")
  vim.cmd("highlight TabLineSel gui=none guibg=none guifg=#dc322f")

end

-- Vim colorizer
require('colorizer').setup()

return M
