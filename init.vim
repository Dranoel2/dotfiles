" Plugins ------------------------------------------------------------------ {{{
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
Plug 'lukas-reineke/virt-column.nvim'

Plug 'tpope/vim-fugitive'

call plug#end()
" }}}

" Theme -------------------------------------------------------------------- {{{
set termguicolors
let g:dracula_colorterm=0
colorscheme dracula
" }}}

" Settings ----------------------------------------------------------------- {{{
set autochdir
set noexpandtab
set tabstop=4
set shiftwidth=4
set number
set colorcolumn=80
set foldmethod=marker
set cursorline
" }}}

" Keybinds ----------------------------------------------------------------- {{{
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

smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" }}}

" Commands ----------------------------------------------------------------- {{{
command Reload :source ~/.config/nvim/init.vim
" }}}

" Autocomplete ------------------------------------------------------ {{{
sign define LspDiagnosticsSignError text=
sign define LspDiagnosticsSignWarning text=
sign define LspDiagnosticsSignInformation text=
sign define LspDiagnosticsSignHint text=

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

local capabilities = require('cmp_nvim_lsp')
	.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lsp = require 'lspconfig'

function conf(table) 
  base = { capabilities = capabilities };
  for k,v in pairs(table) do base[k] = v end;
  return base;
end

local home = os.getenv("HOME")

lsp.jdtls.setup(conf{cmd = { 'bash', home .. '/.dotfiles/jdtls.sh'}})
lsp.tailwindcss.setup(conf{})
lsp.svelte.setup(conf{})
lsp.ccls.setup(conf{ root_dir = lsp.util.root_pattern('Makefile') })
 
EOF
" }}}

" Plugin Config ------------------------------------------------------------ {{{
lua << EOF

require("indent_blankline").setup {}
require("virt-column").setup {}

EOF
" }}}

" Statusline --------------------------------------------------------------- {{{
highlight StatusLine guifg=#000000
highlight User1 guifg=#000000 guibg=#bd93f9 
highlight User2 guibg=#f1fa8c guifg=#bd93f9
highlight User3 guibg=#f1fa8c guifg=#000000
highlight User4 guibg=#50fa7b guifg=#f1fa8c
highlight User5 guibg=#50fa7b guifg=#000000
highlight User6 guifg=#50fa7b
function StatusLine()
	let statusline=""
	let statusline.="%1*\ \ %f\ "
	let statusline.="%2*%3*"
	let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ '\ :''}"
	let statusline.="%4*%5*"
	let statusline.="\ \ %l:%c\ %6*"
	return statusline
endfunction
set statusline=%!StatusLine()
"  }}}
