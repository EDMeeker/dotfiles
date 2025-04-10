set encoding=utf-8
" Display Settings
set number relativenumber
set backspace=2
set path+=**
set wildmenu
set t_Co=256
set nojoinspaces
set nowrap

" Tab Settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
filetype plugin indent on

" Color Scheme (Dreamy Night)
" MediumPurple4 - #5f5f87 - rgb(95,95,135)   - 60
" Grey63        - #af87af - rgb(175,135,175) - 139
" SlateBlue3    - #5f5fd7 - rgb(95,95,215)   - 61
" LightPink3    - #d78787 - rgb(215,135,135) - 174
" MistyRose1    - #ffd7d7 - rgb(255,215,215) - 224

" Syntax and Color Configuration
syntax enable

" Line number colors - keep current line number color consistent
highlight LineNr ctermfg=60 ctermbg=NONE
highlight CursorLineNr ctermfg=174 ctermbg=NONE cterm=NONE

" Default text color to MistyRose1
highlight Normal ctermfg=224

" Highlight current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=236

" Syntax highlighting elements
highlight Statement ctermfg=174
highlight Identifier ctermfg=139
highlight Type ctermfg=61
highlight Comment ctermfg=60
highlight String ctermfg=224
highlight Constant ctermfg=174
highlight Special ctermfg=139
highlight PreProc ctermfg=61

" Highlight columns surpassing 80 characters
highlight Overlength ctermbg=61 ctermfg=174
match Overlength /\%80v.\+/

" Make matching brackets more visible
highlight MatchParen ctermbg=60 ctermfg=224

" Search highlighting
set hlsearch
highlight Search ctermbg=61 ctermfg=224
" Search case sensitivity
set ignorecase
set smartcase

" Visual selection highlighting
highlight Visual ctermbg=60 ctermfg=224
" MediumPurple4 bg, MistyRose1 fg

" Completion menu
highlight Pmenu ctermfg=224 ctermbg=61      " Menu text and background
highlight PmenuSel ctermfg=224 ctermbg=139  " Selected menu item
highlight PmenuSbar ctermbg=236             " Scrollbar background
highlight PmenuThumb ctermbg=174            " Scrollbar thumb

" Diff view colors
highlight DiffAdd ctermfg=NONE ctermbg=22        " Added lines
highlight DiffChange ctermfg=NONE ctermbg=17     " Changed lines
highlight DiffDelete ctermfg=174 ctermbg=NONE    " Deleted lines
highlight DiffText ctermfg=224 ctermbg=61        " Changed text within lines

" Spell checking colors
highlight SpellBad ctermfg=174 ctermbg=NONE cterm=underline    " Misspelled words
highlight SpellCap ctermfg=61 ctermbg=NONE cterm=underline     " Capitalization errors
highlight SpellRare ctermfg=139 ctermbg=NONE cterm=underline   " Rare words
highlight SpellLocal ctermfg=60 ctermbg=NONE cterm=underline   " Words specific to another region

" Key Mappings
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Force status line configuration
set laststatus=2                                 " Always show status line
highlight clear StatusLine                       " Clear any existing settings
highlight clear StatusLineNC                     " Clear inactive status line settings
highlight StatusLine ctermfg=224 ctermbg=238     " MistyRose1 text on medium-dark gray background
highlight StatusLineNC ctermfg=139 ctermbg=237   " Grey63 text on slightly darker background
set statusline=\ %{winnr()}\ %f%=%y\ %l:%c\      " Format: window number, filename, filetype, position
