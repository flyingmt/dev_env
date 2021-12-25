set nocompatible                " disable compatibility to old-time vi
set showmatch                   " show matching 
set ignorecase                  " case insensitive 
set mouse=v                     " middle-click paste with 
set hlsearch                    " highlight search 
set incsearch                   " incremental search
set tabstop=4                   " number of columns occupied by a tab
set softtabstop=4               " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                   " converts tabs to white space
set shiftwidth=4                " width for autoindents
set number                      " add line numbers
set cc=80                       " set an 80 column border for good coding style
set mouse=a                     " enable mouse click
set clipboard=unnamedplus       " using system clipboard
set cursorline                  " highlight current cursorline
set relativenumber

set termguicolors
set smartindent
set numberwidth=1
set relativenumber
"set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/AppData/Local/nvim/undodir
set undofile
set incsearch
set nohlsearch
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set scrolloff=999
set noshowmode
set updatetime=250 

set encoding=UTF-8


" Plugins (:PlugInstall, :PlugClean)
call plug#begin()

 Plug 'ryanoasis/vim-devicons'  	" Developer Icons
 Plug 'scrooloose/nerdtree'			" A file explorer for neovim	
 Plug 'preservim/nerdcommenter'		" An easy way for commenting out lines
 
 Plug 'nvim-lua/plenary.nvim' " Telescope
 Plug 'nvim-telescope/telescope.nvim' " Telescope


 "Plug 'SirVer/ultisnips'			" Snippets engine
 "Plug 'honza/vim-snippets'			" A collection of snippets
 "Plug 'mhinz/vim-startify'			" A really handy start page with lots of customizations
 "Plug 'neoclide/coc.nvim', {'branch': 'release'}

 Plug 'neovim/nvim-lspconfig'
 Plug 'hrsh7th/cmp-nvim-lsp'
 Plug 'hrsh7th/cmp-buffer'
 Plug 'hrsh7th/cmp-path'
 Plug 'hrsh7th/cmp-cmdline'
 Plug 'hrsh7th/nvim-cmp'

 " For vsnip users.
 Plug 'hrsh7th/cmp-vsnip'
 Plug 'hrsh7th/vim-vsnip'

 Plug 'tpope/vim-surround'				" Surrounding ysw)
 Plug 'vim-airline/vim-airline'			" Status bar
 Plug 'ap/vim-css-color'				" CSS Color Preview
 Plug 'rafi/awesome-vim-colorschemes'	" Retro Scheme
 "Plug 'tc50cal/vim-terminal'			" Vim Terminal
 Plug 'terryma/vim-multiple-cursors'	" CTRL + N for multiple cursors
 Plug 'preservim/tagbar'				" Tagbar for code navigation
 Plug 'Raimondi/delimitMate'            " Auto Closes quotes, parenthesis, brackets  
 Plug 'ctrlpvim/ctrlp.vim'				" Ctrl + P for search file
 "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'akinsho/toggleterm.nvim'
 "Plug 'glepnir/lspsaga.nvim'

 " Markdown Preview (:MarkdownPreview, :MarkdownPreviewStop)
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

 call plug#end()

" Find files using Telescope command-line sugar.
nnoremap ff :Telescope find_files<cr>
nnoremap fg :Telescope live_grep<cr>
nnoremap fb :Telescope buffers<cr>
nnoremap fh :Telescope help_tags<cr>


" Nerd Tree
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" LSP Saga
"nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
"nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"nnoremap <silent> gh :Lspsaga lsp_finder<CR>
"nnoremap <silent> gp :Lspsaga preview_definition<CR>

set completeopt-=preview " For No Previews

colorscheme jellybeans


" Open new split panes to right and below
"set splitright
"set splitbelow


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set completeopt=menu,menuone,noselect

let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

"Save
nnoremap <silent> <C-S> :w<cr>

lua <<EOF
  

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {}
  require('lspconfig')['rls'].setup {}
  require('lspconfig')['golangci_lint_ls'].setup {}
  require('lspconfig')['gopls'].setup {}
  require('lspconfig')['csharp_ls'].setup {}

  require("toggleterm").setup {
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal', --'vertical' | 'horizontal' | 'window' | 'float',
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
  }

EOF
