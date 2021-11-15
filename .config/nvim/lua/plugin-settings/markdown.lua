local options = {
  mkdp_auto_start = false,
  mkdp_auto_close = false,    -- auto close when switching buffer
  mkdp_refresh_slow = false,  -- true: update on save, false: live update
}

 for opt ,val in pairs(options) do
   vim.g[opt] = val
 end
