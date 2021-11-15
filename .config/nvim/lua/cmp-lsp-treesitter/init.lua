-- Ultisnips --
-- Calling ExpandTrigger,
-- will make nvim-cmp completion behave
-- like a UltiSnips placeholder.
-- this is possible because nvim-cmp has complete snippet support
local options = {
  UltiSnipsExpandTrigger = "<M-CR>",
  UltiSnipsJumpForwardTrigger= "<M-CR>",
  UltiSnipsJumpBackwardTrigger = "<M-BS>",
  UltiSnipsListSnippets = "<C-?>",
  UltiSnipsEditSplit = "vertical",
}

for opt,val in pairs(options) do
	vim.g[opt] = val
end


-- CMP --
local cmp = require('cmp')

vim.o.completeopt = 'menuone,noselect'

cmp.setup({
  completion = {
    completeopt = vim.o.completeopt,
  },

  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-q>'] = cmp.mapping.close(),
    ['<C-c>'] = cmp.mapping.complete(), -- open completion menu
    ['<Tab>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  documentation = {
    border = "rounded",
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 100,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  },

  -- LSP results icon like VSCode
  -- INSTALL:
  -- onsails/lspkind-nvim
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require('lspkind').presets.default[vim_item.kind]

      -- Label the source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        path = "[Path]",
        ultisnips = "[Snippet]",
      })[entry.source.name]

      return vim_item
    end
  },

  sources = {
    -- { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'ultisnips' },
  },

  -- INSTALL:
  -- quangnguyen30192/cmp-nvim-ultisnips
  snippet = {
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body)
    end,
  },

  -- EXPERIMENTAL:
  experimental = {
    ghost_text = true,
    native_menu = false
  },

})

-- LSP DIAGNOSTIC
local default_settings = {
  virtual_text = true,
  underline = true,
  signs = true,
}

-- Define symbols for diagnostic signs
vim.cmd('sign define LspDiagnosticsSignError text=  texthl=LspDiagnosticsSignError linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=  texthl=LspDiagnosticsSignWarning linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=  texthl=LspDiagnosticsSignInformation linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text=  texthl=LspDiagnosticsSignHint linehl= numhl=')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    default_settings
)

-- LSP START
-- If you want to install & activate the LSP, go to:
--      https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
--
-- And then search your desired Language Server, install it in your machine.
-- Neovim doesn't launch the Language Server, Neovim is the CLIENT. So you have
-- to download the language server manually.
--
-- After you download the language server, you have to connect Neovim to LSP using:
--
--      require('lspconfig').<language_server>.setup{}
--
-- Or if you want to enable the LSP_signature_setup for better code hover documentation:
--
--      require('lspconfig').<language_server>.setup(LSP_signature_setup)
--
-- The name of <language_server> must match with the one available at file CONFIG.md


-- Attach Custom functionality on LSP startup:
--   1. LSP signature to enable better function documentation
--   2. Completion icons (functions, classes, etc)
--   3. Auto formatting on buffer save
local LSP_signature_setup = {
	on_attach = function(client, bufnr)

    -- Better pop up documentation
		require('lsp_signature').on_attach{
      bind = true,  -- Mandatory for config
      doc_lines = 5,
      floating_window = true,
      fix_pos = false,
      hint_enable = true,
      hint_prefix = "<> ",
      hint_scheme = "String",
      use_lspsaga = true,
      hi_parameter = "Search",
      max_height = 12,
      max_width = 120,
      handler_opts = {
        border = "double" -- single/double/shadow
      },
    }

    -- autoformat on save
    if client.resolved_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end
  end
}

-- LSPSaga
local lsp_saga = require('lspsaga')
lsp_saga.init_lsp_saga{
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  dianostic_header_icon = '  ',
  max_preview_lines = 10,           -- preview lines for provider functions.
  code_action_prompt = {
    enable = false,
  },
  border_style = 'round',
}

-- for capabilities from 'nvim_lsp' source
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.snippetSupport = true

require('lspconfig').rust_analyzer.setup{
  filetypes = { "rust" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities,
}

require('lspconfig').ccls.setup{
  filetypes = { "c", "cpp", "objc", "objcpp" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities,
}

require('lspconfig').vimls.setup{
    filetypes = { 'vim' },
    on_attach = LSP_signature_setup.on_attach,
    capabilities = capabilities
}

require('lspconfig').pyright.setup{
  filetypes = { "python" },
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities,
}

require('lspconfig').bashls.setup{
  filetypes = {'sh', 'zsh'},
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities,
}

require('lspconfig').cmake.setup{
  filetypes = { "cmake" },
  on_attach = LSP_signature_setup.on_attach
}

require('lspconfig').html.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities
}

require('lspconfig').cssls.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities
}

require('lspconfig').tsserver.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities
}

require('lspconfig').intelephense.setup{
  on_attach = LSP_signature_setup.on_attach,
  capabilities = capabilities
}


-- Treesitter --
require('nvim-treesitter.configs').setup {

  ensure_installed = {
    'lua',
    'bash',
    'cpp',
    'c',
    'html',
    'css',
    'javascript',
    'php',
    'python'
  },

  highlight = {
	enable = true,

    -- ISSUE: Markdown Breaks some text highlighting
    -- For some reason, php has better syntax highlighting without TS,
    -- might be an issue for my colorscheme though
    disable = { "markdown", "latex", "html", "php" },
		additional_vim_regex_highlighting = false,
  },

  indent = {
		enable = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm'
    }
  },

  -- Custom text objects
  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {

        -- around function
        ['af'] = '@function.outer',

        -- inside function
        ['if'] = '@function.inner',

        -- around class
        ['ac'] = '@class.outer',

        -- inside class
        ['ic'] = '@class.inner',

      }
    }
  }
}
