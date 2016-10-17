" Color scheme: Olivier
"
" It is based on "happy_hacking" by "Yorick Peterse" with some tweaks on
" Cursor, Special, Visual, Define, Todo, etc.
" Also, language specific color scheme are added for Perl and Verilog/SystemVerilog.
"
" TODO: Need to work on terminal color with 256 colors, xterm-256color setting
" with t_AF=<ESC>[36;5;%dm does not work in xterm on CentOS 6.4.
"
" Author:  DK Kim
" License: MIT
" Website: https://github.com/mjj-appa/.vim/color-scheme/olivier.vim

set background=dark
"set t_Co=256               " this doesn't work in cterm with term_256color

hi clear

if exists("syntax_on")
  syntax reset
end

let colors_name = "olivier"

" ============================================================================
" GUI Colors
"
" This section defines all the colors to use when running Vim as a GUI (Gvim,
" Macvim, etc). These colors are *not* used when Vim is run in a terminal.

let s:white    = "#F3F2CC"
let s:black1   = "#000000"
let s:black2   = "#202020"
let s:yellow   = "#F2CE61"
let s:yellow1  = "#FBECAF"
let s:blue     = "#7895B7"
let s:green    = "#95B572"
let s:turqoise = "#B3EBBF"
let s:orange   = "#E8A75C"
let s:pink     = "#F77EBD"
let s:purple   = "#CC9BCA"
let s:gold     = "#CBC983"
let s:red1     = "#e6341b"
let s:red2     = "#ED5A45"
let s:gray1    = "#292929"
let s:gray2    = "#525252"
let s:gray3    = "#6c6c6c"
let s:gray4    = "#7c7c7c"
let s:gray5    = "#aaaaaa"
let s:gray6    = "#393939"

" ============================================================================
" Terminal Colors
"
" This section defines all the colors that are used when Vim is run inside a
" terminal instead of a GUI.

let s:t_white    = "230"
let s:t_black1   = "16"
let s:t_black2   = "16"
let s:t_yellow   = "221"
let s:t_blue     = "103"
let s:t_green    = "107"
let s:t_turqoise = "157"
let s:t_orange   = "179"
let s:t_pink     = "211"
let s:t_gold     = "186"
let s:t_red1     = "166"
let s:t_red2     = "203"
let s:t_gray1    = "235"
let s:t_gray2    = "59"
let s:t_gray3    = "59"
let s:t_gray4    = "102"
let s:t_gray5    = "145"
let s:t_gray6    = "237"

" ============================================================================
" Color Functions

" Function for creating a highlight group with a GUI/Terminal foreground and
" background. No font styling is applied.
function! s:Color(group, fg, bg, t_fg, t_bg, ...)
  if empty(a:0)
    let style = "NONE"
  else
    let style = a:1
  end

  exe "hi " . a:group . " gui="   . style . " guifg="   . a:fg   . " guibg="   . a:bg
    \                 . " cterm=" . style . " ctermfg=" . a:t_fg . " ctermbg=" . a:t_bg
endfunction

" ============================================================================
" General Syntax Elements
"
" Definitions for generic syntax elements such as strings and numbers.

call s:Color("Pmenu"        , s:white       , s:black2      , s:t_white     , s:t_black2                )
call s:Color("PmenuSel"     , s:white       , s:gray2       , s:t_white     , s:t_gray2                 )
call s:Color("Cursor"       , "NONE"        , s:gray4       , "NONE"        , s:t_gray4                 )
call s:Color("Normal"       , s:white       , s:gray1       , s:t_white     , s:t_gray1                 )
call s:Color("Search"       , s:black1      , s:blue        , s:t_black1    , s:t_yellow                )
call s:Color("Title"        , s:white       , "NONE"        , s:t_white     , "NONE"        , "bold"    )

call s:Color("LineNr"       , s:gray3       , "NONE"        , s:t_gray3     , "NONE"                    )
call s:Color("StatusLine"   , s:white       , s:gray6       , s:t_white     , s:t_gray6                 )
call s:Color("StatusLineNC" , s:gray4       , s:gray6       , s:t_gray4     , s:t_gray6                 )
call s:Color("VertSplit"    , s:gray3       , "NONE"        , s:t_gray3     , "NONE"                    )
call s:Color("ColorColumn"  , "NONE"        , s:gray6       , "NONE"        , s:t_gray6                 )
call s:Color("Visual"       , "NONE"        , s:gray2       , "NONE"        , s:t_gray4                 )

call s:Color("Folded"       , s:gray4       , "NONE"        , s:t_gray4     , "NONE"                    )
call s:Color("FoldColumn"   , s:gray3       , s:gray1       , s:t_gray3     , s:t_gray1                 )
call s:Color("ErrorMsg"     , s:red2        , "NONE"        , s:t_red2      , "NONE"        , "bold"    )
call s:Color("WarningMsg"   , s:yellow      , "NONE"        , s:t_yellow    , "NONE"        , "bold"    )
call s:Color("Question"     , s:white       , "NONE"        , s:t_white     , "NONE"                    )

call s:Color("SpecialKey"   , s:white       , s:gray2       , s:t_white     , s:t_gray2                 )
call s:Color("Directory"    , s:blue        , "NONE"        , s:t_blue      , "NONE"                    )

call s:Color("Comment"      , s:gray4       , "NONE"        , s:t_gray4     , "NONE"                    )
call s:Color("Todo"         , s:black1      , s:orange      , s:t_gray5     , "NONE"        , "bold"    )
call s:Color("String"       , s:green       , "NONE"        , s:t_green     , "NONE"                    )
call s:Color("Keyword"      , s:red2        , "NONE"        , s:t_red2      , "NONE"                    )
call s:Color("Number"       , s:turqoise    , "NONE"        , s:t_turqoise  , "NONE"                    )
call s:Color("Regexp"       , s:orange      , "NONE"        , s:t_orange    , "NONE"                    )
call s:Color("Function"     , s:gold        , "NONE"        , s:t_gold      , "NONE"                    )
call s:Color("Notice"       , s:yellow      , "NONE"        , s:t_yellow    , "NONE"                    )
call s:Color("Special"      , s:yellow1     , "NONE"        , s:t_green     , "NONE"                    )
call s:Color("Define"       , s:purple      , "NONE"        , s:t_red2      , "NONE"                    )

call s:Color("MatchParen"   , s:yellow      , "NONE"        , "NONE"        , "NONE"        , "bold"    )

hi! link CursorLine     Cursor
hi! link Identifier     Normal
hi! link Constant       Normal
hi! link Operator       Normal
hi! link Type           Keyword
hi! link Statement      Keyword
hi! link PmenuThumb     PmenuSel
hi! link SignColumn     FoldColumn
hi! link Error          ErrorMsg
hi! link NonText        LineNr
hi! link PreProc        Normal
hi! link Boolean        Keyword
hi! link StorageClass   Normal
hi! link MoreMsg        Normal

" ============================================================================
" Specific Languages
"
" Language specific settings that would otherwise be too generic. These
" definitions are sorted in alphabetical order.

" C/C++
hi! link cCharacter                 String

" Coffeescript
hi! link coffeeRegex                Regexp
hi! link coffeeSpecialIdent         Directory

" CSS
hi! link cssIdentifier              Title
hi! link cssClassName               Directory
hi! link cssMedia                   Notice
hi! link cssColor                   Number
hi! link cssTagName                 Normal
hi! link cssImportant               Notice

" D
hi! link dDebug                     Notice
hi! link dOperator                  Operator
hi! link dStorageClass              Keyword
hi! link dAnnotation                Directory
hi! link dAttribute                 dAnnotation

" Diffs
hi! link diffFile                   WarningMsg
hi! link diffLine                   Number
hi! link diffAdded                  String
hi! link diffRemoved                Keyword

hi! link DiffChange                 Notice
hi! link DiffAdd                    diffAdded
hi! link DiffDelete                 diffRemoved
hi! link DiffText                   diffLine

" Dot (GraphViz)
hi! link dotKeyChar                 Normal

" Git commits
hi! link gitCommitSummary           String
hi! link gitCommitOverflow          ErrorMsg

" HAML
hi! link hamlId                     Title
hi! link hamlClass                  Directory
hi! link htmlArg                    Normal
hi! link hamlDocType                Comment

" HTML
hi! link htmlLink                   Directory
hi! link htmlSpecialTagName         htmlTag
hi! link htmlTagName                htmlTag
hi! link htmlScriptTag              htmlTag

" Javascript
hi! link javaScriptBraces           Normal
hi! link javaScriptMember           Normal
hi! link javaScriptIdentifier       Keyword
hi! link javaScriptFunction         Keyword
hi! link JavaScriptNumber           Number

" Java
hi! link javaCommentTitle           javaComment
hi! link javaDocTags                Todo
hi! link javaDocParam               Todo
hi! link javaStorageClass           Keyword
hi! link javaAnnotation             Directory
hi! link javaExternal               Keyword

" JSON
hi! link jsonKeyword                String

" Less
hi! link lessClass                  cssClassName

" Make
hi! link makeTarget                 Function

" Markdown
hi! link markdownCodeBlock          Todo
hi! link markdownCode               markdownCodeBlock
hi! link markdownListMarker         Keyword
hi! link markdownOrderedListMarker  Keyword

" NERDTree
hi! link NERDTreeRO                 Notice
hi! link NERDTreeCWD                Title
hi! link NERDTreeLink               Number
hi! link NERDTreeDir                Directory
hi! link NERDTreeOpenable           NERDTreeDir
hi! link NERDTreeClosable           NERDTreeDir

" Perl
hi! link podCommand                 Comment
hi! link podCmdText                 Todo
hi! link podVerbatimLine            Todo
hi! link perlStatementInclude       Statement
hi! link perlStatementPackage       Statement
hi! link perlPackageDecl            Normal
hi! link perlOperator               Keyword
hi! link perlVarPlain               Special
hi! link perlSpecialString          Directory

" Ragel
hi! link rlAugmentOps               Operator

" Ruby
hi! link rubySymbol                 Regexp
hi! link rubyConstant               Constant
hi! link rubyInstanceVariable       Directory
hi! link rubyClassVariable          rubyInstancevariable
hi! link rubyClass                  Keyword
hi! link rubyModule                 rubyClass
hi! link rubyFunction               Function
hi! link rubyDefine                 Keyword
hi! link rubyRegexp                 Regexp
hi! link rubyRegexpSpecial          Regexp
hi! link rubyRegexpCharClass        Normal
hi! link rubyRegexpQuantifier       Normal

" Rust
hi! link rustFuncCall               Identifier
hi! link rustCommentBlockDoc        Comment
hi! link rustCommentLineDoc         Comment

" SASS
hi! link sassClass                  cssClassName
hi! link sassId                     cssIdentifier
hi! link sassInclude                cssMedia

" Shell
hi! link shFunctionKey              Keyword
hi! link shTestOpr                  Operator
hi! link bashStatement              Normal

" SQL
hi! link sqlKeyword                 Keyword

" TypeScript
hi! link typescriptBraces           Normal
hi! link typescriptEndColons        Normal
hi! link typescriptFunction         Function
hi! link typescriptFuncKeyword      Keyword
hi! link typescriptLogicSymbols     Operator
hi! link typescriptIdentifier       Keyword
hi! link typescriptExceptions       Keyword

" Verilog/SystemVerilog
hi! link verilogGlobal              Define
hi! link verilogTodo                Todo

" Vimscript
hi! link vimGroup                   Constant
hi! link vimHiGroup                 Constant
hi! link VimIsCommand               Constant
hi! link VimCommentTitle            Todo

" YAML
hi! link yamlPlainScalar            String

" YARD
hi! link yardType                   Todo
hi! link yardTypeList               Todo
hi! link yardComment                Comment

" XML
hi! link xmlTagName                 Normal
hi! link xmlTag                     Normal
hi! link xmlAttrib                  Normal
