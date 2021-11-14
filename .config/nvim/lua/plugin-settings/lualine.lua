local M = {}

-----------------------------------------
-- Themes (OUTDATED as of 15 Nov 2021)
-- check repo for new themes!
-----------------------------------------
-- 16color  (blue,green,black dominant)
-- ayu_dark, ayu_light, ayu_mirage
-- dracula
-- everforest (hijau)
-- gruvbox, gruvbox_light, gruvbox_material (sort of cream pink-ish?)
-- horizon (dark blue-pink dominant)
-- iceberg_dark, iceberg_light (very dark purple - very light blue)
-- jellybeans (like seoul256, but darker)
-- material (similar to jellybeans)
-- modus_vivendi (similar to jellybeans)
-- molokai (sublime color but brighter)
-- nightfly (match with tokyonight)
-- nord (like nightfly, but brighter)
-- oceanicnext (light blue)
-- onedark, onelight (atom)
-- palenight
-- papercolor, papecolor_light, papercolor_dark (light theme)
-- powerline (like powerline shell, very bright)
-- seoul256 (match with gruvbuddy / gruvbox)
-- solarized, solarized_light, solarized_dark (match with solarized terminal theme)
-- tokyonight (match with tokyonight.nvim)
-- tomorrow
-- wombat (like seoul256, but lighter)

M.setup_lualine = function(theme)
    require('lualine').setup {
      options = {
        component_separators = {'', ''},
        section_separators = {'', ''},
        theme = theme,

        icons_enabled = true,
        disabled_filetypes = {}
      },
      sections = {

        -- A component must be a table, not sequential args
        lualine_a = {{'mode'}},
        lualine_b = {
          {
            'filetype',
            colored = true
          },
        },
        lualine_c = {
          { 'filename', path = 1, },
          { 'diagnostics',
            sources = {'nvim_lsp'},
            symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
            color_error = '#ff0000',
            color_warn = '#dff705',
            color_info = '#16f70a',
            color_hint = '#05d8f0',
          },
        },
        lualine_x = {
          {
             'diff',
             colored = true,
             color_added = '#16f70a',
             color_modified = '#dff705',
             color_removed = '#ff0000',
             symbols = {added = ' ', modified = '柳 ', removed = ' '},
          },
        },
        lualine_y = { 'branch' },
        lualine_z = {'location'}
      },

      inactive_sections = {
        lualine_a = {
          {
            'filetype',
            colored = true
          },
          {
            'filename',
            path = 0,
          },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_y = {},
        lualine_z = {}
      },

      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      -- },
    }
end

return M
