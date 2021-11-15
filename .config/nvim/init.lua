require('basic-settings')
require('packer-plugins-setup')
require('keymap')

-- PLUGIN SETTINGS
vim.cmd[[source ~/.config/nvim/lua/plugin-settings/tabline.vim]]
require('plugin-settings.color').solarized()
-- require('plugin-settings.color').neo_solarized()
require('plugin-settings.nvim-tree')
require('cmp-lsp')
