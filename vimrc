"///////////////////////////////////////////////////////////////////////////
" Initial configuration
"///////////////////////////////////////////////////////////////////////////
set nocompatible        " Use Vim defaults (much better!), not Vi default (wait...ain't this default when using .vimrc?)
                        " this needs to be set before other options since their default values depend on this

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

"///////////////////////////////////////////////////////////////////////////
" UI setting
"///////////////////////////////////////////////////////////////////////////

set ttyfast             " this is a fast terminal, smooth feel with multiple windows
set nobackup            " don't keep .swp file (see 'writebackup')
set writebackup         " keep .swp only while editing
set hidden              " buffer becomes hidden when it is abandoned
set mousehide           " Hide the mouse when typing text

set noerrorbells        " turn off error bells
set visualbell          " beeps are so annoying
set ruler               " show the line and column number of the cursor position, don't like line number with "number"
set showmode            " show current mode on bottom line
set showcmd             " show (partial) command in the last line of the screen (Vim default: on anyways...)
set laststatus=2        " always show a status line
set shortmess=at        " shorten info to not clobber with file name

set wildmenu            " enhanced command-line completion
set showmatch           " show matching parens, braces
set startofline

set list listchars=tab:»·,trail:·   " show tabs and blanks after end-of-line

"set imdisable          " Input Method relatively works well...?
set viminfo=%,'50,\"100,:100,n~/.viminfo

"///////////////////////////////////////////////////////////////////////////
" Editing
"///////////////////////////////////////////////////////////////////////////

set esckeys             " recognize ESC keys in INSERT mode (Vim default: on anyways...)
set nodigraph           " mostly editing simple text file

set nowrap              " no wrapping displaying long lines
set wrapmargin=0        " no wrapping while typing
set textwidth=0         " doncha hate when automatic wrapping happens in the middle of typing?

set formatoptions=n1cqrt  " see :h formatoptions & fo-table
set backspace=indent,eol,start      " allow backspacing over everything (indent, eol, and start) in insert mode
set whichwrap=b,s,<,>   " which keys are allowed to wrap around ends of lines

"///////////////////////////////////////////////////////////////////////////
" Tab and spacing
"///////////////////////////////////////////////////////////////////////////

set expandtab           " write spaces instead of tabs (tabs are evil!...well, of course unless Makefile)
set smarttab            " do intelligent tabbing
set tabstop=4           " tabstops every 4 spaces
set shiftwidth=4        " shifts and tabs are 4 spaces (for <<, >>, cindent)
set autoindent          " normally start at same indentation as previous line
set nosmartindent       " no smart indent except for certain filetypes
if has("autocmd")
    au FileType verilog set smartindent
    au FileType perl    set smartindent
    au FileType cpp     set smartindent
    au FileType sh      set smartindent
    au FileType c       set smartindent
endif

"///////////////////////////////////////////////////////////////////////////
" Split window
"///////////////////////////////////////////////////////////////////////////

set splitbelow          " when creating split windows

" split windown navigation
nnoremap <c-Up>    <c-w><c-k>
nnoremap <c-Down>  <c-w><c-j>
nnoremap <c-Left>  <c-w><c-h>
nnoremap <c-Right> <c-w><c-l>

"///////////////////////////////////////////////////////////////////////////
" Search
"///////////////////////////////////////////////////////////////////////////

set hlsearch            " hilight search patterns found in text
set noincsearch         " don't like jumping around while typing search pattern

" turn off search highlight as soon as we hit another carriage return
nnoremap <silent> <CR> :nohlsearch<CR><CR>

"///////////////////////////////////////////////////////////////////////////
" Shortcuts
"///////////////////////////////////////////////////////////////////////////

" <Shift-e> to open file under cursor in normal mode
nnoremap E gf

" <dp> to remove contents between the parenthesis under cursor and to be ready to insert
nnoremap dp F(l<c-v>f)hdi

" "F7" to togglecursor crosshairs:
func! Tog_Crosshairs(tog)
    if !exists("b:crosshairs")
        let b:crosshairs = 0
    endif
    if (a:tog)
        let b:crosshairs = !b:crosshairs
    endif
    if b:crosshairs
        set cursorcolumn
        set cursorline
    else
        set nocursorcolumn
        set nocursorline
    endif
    return ''
endfunc
inoremap <silent> <F7> <ESC>:call Tog_Crosshairs(1)<CR>a
nnoremap <silent> <F7> :call Tog_Crosshairs(1)<CR>

autocmd BufEnter * call Tog_Crosshairs(0)

" "F8" to toggle spell-check:
func! Tog_Spelling(tog)
    if !exists("b:spelling")
        let b:spelling = 0
    endif
    if (a:tog)
        let b:spelling = !b:spelling
        if (b:spelling)
            echo "Spell check ON"
        else
            echo "Spell check OFF"
        endif
    endif
    if b:spelling
        set spell
    else
        set nospell
    endif
    return ''
endfunc
inoremap <silent> <F8> <ESC>:call Tog_Spelling(1)<CR>a
nnoremap <silent> <F8> :call Tog_Spelling(1)<CR>
autocmd BufEnter * call Tog_Spelling(0)

"///////////////////////////////////////////////////////////////////////////
" Font and color
"///////////////////////////////////////////////////////////////////////////
if has ("gui_running")          " TODO: ahrr..need to figure out why cterm doesn't work..
    color olivier
endif

set guifont=monaco,monospace    " monaco is cooool

"///////////////////////////////////////////////////////////////////////////
" Syntax highlight
"///////////////////////////////////////////////////////////////////////////

":if has("terminfo")
":  set t_Co=16
":  set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
":  set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
":endif

" <Ctrl-Shift-p> to get information on syntax highlight group of word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

syntax on

