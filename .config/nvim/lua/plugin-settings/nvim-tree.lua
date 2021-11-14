-- Global options have to be set before calling setup
local options = {
  nvim_tree_icons = {
    default = "" ,
    symlink = "" ,

    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },

    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },

    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }
}

-- Global options have to be set before calling setup
for opt,val  in pairs(options) do
  vim.g[opt] = val
end

require("nvim-tree").setup{
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,

  -- puts cursor at beginning of filename
  hijack_cursor       = true,
}
