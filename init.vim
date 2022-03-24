call plug#begin('~/.config/nvim/plugins')

Plug 'dracula/vim',{'name':'dracula'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'

Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'vimwiki/vimwiki'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()


let g:dracula_colorterm=0
colorscheme dracula

set autochdir
set tabstop=2
set shiftwidth=2
set expandtab
set number

sign define LspDiagnosticsSignError text=
sign define LspDiagnosticsSignWarning text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint text=

nnoremap <silent> gd         <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi         <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr         <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gD         <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ge         <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> K          <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <leader>f  <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>
xmap     <silent> <leader>a  <cmd>lua vim.lsp.buf.code_action()<CR>

command Reload :source ~/.config/nvim/init.vim

lua << EOF

local cmp = require 'cmp'

vim.opt.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end,
  },
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(), 
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require 'lspconfig'

function conf(table) 
  base = { capabilities = capabilities };
  for k,v in pairs(table) do base[k] = v end;
  return base;
end

lsp.jdtls.setup(conf{cmd = { 'bash', os.getenv('HOME') .. '/.dotfiles/jdtls.sh'} })
lsp.tailwindcss.setup(conf{})
lsp.svelte.setup(conf{})
lsp.elmls.setup(conf{})
lsp.ccls.setup(conf{})
 
EOF
