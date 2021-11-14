local execute = vim.api.nvim_command
local fn = vim.fn

-- Ensure that packer is always installed in new machine
-- Might differ on macOS & winOS
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local new_install = false

if fn.empty(fn.glob(install_path)) > 0 then
  print('[PACKER] Packer not yet installed')
  print('[PACKER] Now installing packer in' .. install_path)
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute('packadd packer.nvim')
  new_install = true
end


require('packer').startup(function()
  -- WARNING: Packer self management, DO NOT REMOVE
  use {'wbthomason/packer.nvim'}

  -- Start menu
  use {'mhinz/vim-startify'}

  -- File tree preview
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Solarized
  use {'ishan9299/nvim-solarized-lua'}

  -- alternative
  use {'overcache/NeoSolarized'}

  -- Status line
  use {
    'hoob3rt/lualine.nvim', 
    requires = {
      'kyazdani42/nvim-tree.lua'
    } 
  }

  -- Colorizer for color codes like this one -> #ff0000
  use {'norcalli/nvim-colorizer.lua'}

  -- LSP (Language Server)
  use {'neovim/nvim-lspconfig'}
  use {'ray-x/lsp_signature.nvim'}
  use {'glepnir/lspsaga.nvim'}

  -- Completion engine
  use {'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'onsails/lspkind-nvim', -- for labels & icons
    }
  }

  -- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter'}
  use {'nvim-treesitter/playground'}
  use {'nvim-treesitter/nvim-treesitter-textobjects'}

  -- Telescopeee, behold the most overpowered meta plugin
  use {'nvim-lua/popup.nvim'}
  use {'nvim-lua/plenary.nvim'}
  use {'nvim-telescope/telescope.nvim'}
  use {'nvim-telescope/telescope-symbols.nvim'}
  use {'nvim-telescope/telescope-fzy-native.nvim'}
  use {'fhill2/telescope-ultisnips.nvim', requires = {'SirVer/ultisnips'}}
  use {'nvim-telescope/telescope-project.nvim'}

  -- Git it gud
  use {'tpope/vim-fugitive'}
  use {'tpope/vim-rhubarb', requires = {'tpope/vim-fugitive'}}

  -- Snippets
  use {'SirVer/ultisnips'}
  use {'honza/vim-snippets'}

  -- Bracket stuffs
  use {'jiangmiao/auto-pairs'}
  use {'tpope/vim-surround'}

  -- Commentary
  use {'tpope/vim-commentary'}

  -- Visual Multi
  use {'mg979/vim-visual-multi'}

  -- Markdown editing
  use {'iamcco/markdown-preview.nvim', run = ':call mkdp#util#install()'}

  -- Note taking
  use {'vimwiki/vimwiki'}

  -- Distant.nvim
  -- SSH editing like Visual Studio Code Remote
  use {'chipsenkbeil/distant.nvim'}
end)

if new_install then
  vim.cmd('PackerInstall')
end
