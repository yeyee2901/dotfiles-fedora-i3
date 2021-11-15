local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local actions_state = require('telescope.actions.state')

local distant_telescope = {}

-- Specify your servers & hosts pairs here!
distant_telescope.servers = {
  ["Pemrogaman Web - server bima.eng.wima.ac.id"] = {
    host = "bima.eng.wima.ac.id",
    user = "te18003"
  },

  ["Raspberry Pi 4 @ my home"] = {
    host = "192.168.1.29",
    user = "pi"
  },
}

-- Callback function for default "select" event
-- (selecting an item with <CR>)
local connect = function(prompt_bufnr)
  actions.close(prompt_bufnr)

  local selected = actions_state.get_selected_entry()[1]
  local host = distant_telescope.servers[selected].host
  local user = distant_telescope.servers[selected].user

  -- Launch Distant.nvim
  local command = 'DistantLaunch ' .. host .. ' mode=ssh ssh.user=' .. user
  vim.cmd(command)
end

-- Default options, don't change this one, just copy it on your custom
-- opts, and change some fields as needed
distant_telescope.default_opts = {
  prompt_title = "< Distant SSH >",
  layout_config = {
    width = 0.6,
    height = 0.7,
    prompt_position = "top"
  },

  finder = finders.new_table({}),
  sorter = sorters.get_generic_fuzzy_sorter(),
  sorting_strategy = "ascending",

  attach_mappings = function(prompt_bufnr, _)
    actions.select_default:replace(connect)
    return true
  end
}

distant_telescope.open = function(user_opts)
  user_opts = user_opts or {}

  local servers = {}
  local length = 0

  -- asign keys of distant_telescope.servers to local var & count its length
  for k,_ in pairs(distant_telescope.servers) do
    length = length + 1
    servers[length] = k
  end

  -- Launch the telescope only
  -- if the user specified the servers
  if length > 0 then
    user_opts.finder = finders.new_table(servers)
    pickers.new(user_opts, distant_telescope.default_opts):find()
  else
    print("NO SERVER LISTED. Please specify it in distant.lua")
  end
end

-- to execute the function
distant_telescope.open()

return distant_telescope
