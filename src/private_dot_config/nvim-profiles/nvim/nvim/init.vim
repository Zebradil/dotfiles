if !exists('g:vscode')
"===============================================================================
" Plugins
"===============================================================================
" Autoinstall vim-plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'github/copilot.vim'

  " Some defaults from experienced users
  Plug 'tpope/vim-sensible'

  " Fully automatic identation settings
  Plug 'tpope/vim-sleuth'

  " [Un]comment lines with gc
  Plug 'tpope/vim-commentary'

  " Abbreviate, substitute, change case
  Plug 'tpope/vim-abolish'

  " Interactive git diff
  Plug 'airblade/vim-gitgutter'

  " Better diff options
  Plug 'chrisbra/vim-diff-enhanced'

  " Git-wrapper
  Plug 'tpope/vim-fugitive'
  Plug 'rbong/vim-flog'

  " Git-commit browser
  Plug 'junegunn/gv.vim'

  Plug 'junegunn/vim-github-dashboard'

  " Colorschemes
  Plug 'chriskempson/base16-vim'
  Plug 'rakr/vim-one'
  Plug 'joshdick/onedark.vim'

  " Distruction-free writing
  Plug 'junegunn/goyo.vim'

  " Enhancements for netrw
  Plug 'tpope/vim-vinegar'

  " Highlight current text block
  Plug 'junegunn/limelight.vim'

  " Extended suport for matching parenthesis and words
  Plug 'andymass/vim-matchup'

  " Highlight word under the cursor
  Plug 'RRethy/vim-illuminate'

  " Show current context
  Plug 'wellle/context.vim'

  Plug 'vim-airline/vim-airline'

  Plug 'junegunn/vim-easy-align'
  Plug 'junegunn/fzf.vim'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  Plug 'Konfekt/vim-DetectSpellLang'

  " Automatic layout switcher
  Plug 'lyokha/vim-xkbswitch'

  " Language pack
  Plug 'sheerun/vim-polyglot'

  " Conseal ANSI escape sequences and highlight
  Plug 'powerman/vim-plugin-AnsiEsc'

  " Assembly
  Plug 'Shirk/vim-gas'

  " Helm
  Plug 'towolf/vim-helm'

  " Jsonnet
  Plug 'google/vim-jsonnet'

  " YTT and Starlark
  Plug 'cappyzawa/starlark.vim'
  Plug 'vmware-tanzu/ytt.vim'

  " Nginx
  Plug 'vim-scripts/nginx.vim'

  " Ansible
  Plug 'pearofducks/ansible-vim'

  " Pgsql
  Plug 'lifepillar/pgsql.vim'

  " Python
  Plug 'vim-scripts/indentpython.vim'

  " todo.txt
  Plug 'freitass/todo.txt-vim'

  " Identation
  Plug 'Yggdroot/indentLine'

  " Editing helpers
  Plug 'machakann/vim-sandwich'

  " Syntax check
  " Plug 'w0rp/ale'

  " Autoformat
  Plug 'Chiel92/vim-autoformat'

  " Plug 'ervandew/supertab'

  Plug 'editorconfig/editorconfig-vim'

  Plug 'robertbasic/vim-hugo-helper'

  Plug 'tpope/vim-surround'

  Plug 'mattn/emmet-vim'

  " Outline
  Plug 'liuchengxu/vista.vim'

  " Recursively diff and merge directories
  Plug 'will133/vim-dirdiff'

  " Search for definitions
  Plug 'pechorin/any-jump.vim'

  " File icons in explorer windows
  Plug 'ryanoasis/vim-devicons'

  " Plug 'vimwiki/vimwiki'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " Yaml folding
  Plug 'pedrohdz/vim-yaml-folds'
call plug#end()

set mouse=a

set cursorline
set number
set relativenumber
set noshowmode
set termguicolors

" Set word highlight style to underline
hi link illuminatedWord Visual

let g:one_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:airline_theme='onedark'
colorscheme onedark

set exrc
set secure

"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set laststatus=2
set updatetime=100
set inccommand=nosplit
" Avoid automatically splitting of long lines
set formatoptions+=b

set linebreak

set diffopt=filler,internal,algorithm:histogram,indent-heuristic

let mapleader=" "

" Jump to the last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
endif

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -uu

" Required for operations modifying multiple buffers like rename.
set hidden


" =========================== COC config ↓

let g:coc_global_extensions = [
    \ 'coc-browser',
    \ 'coc-explorer',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-phpls',
    \ 'coc-python',
    \ 'coc-rust-analyzer',
    \ 'coc-vetur',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ ]

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" coc-explorer
nnoremap <leader>ee :CocCommand explorer<CR>

" coc-yank
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" =========================== COC config ↑

" Support JSONC
autocmd FileType json syntax match Comment +\/\/.\+$+


" Netrw
" Hit P in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 0
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_winsize=30
" Change directory to the current buffer when opening files.
" set autochdir

let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }
let g:context_enabled = 0

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

let g:fzf_history_dir = '~/.local/share/fzf-history'

" XML files
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

" for .hql files
au BufNewFile,BufRead *.hql set filetype=hive expandtab
" for .q files
au BufNewFile,BufRead *.q set filetype=hive expandtab

" Initially added for vim-go plugin
filetype plugin indent on
" Disable auto reindent on colon in yaml files
autocmd FileType yaml setl indentkeys-=<:>

autocmd FileType           text,markdown,mail setlocal spell
autocmd BufNewFile,BufRead COMMIT_EDITMSG     setlocal spell
let g:detectspelllang_langs = {}
let g:detectspelllang_langs.aspell = ['en', 'ru', 'de_DE']

" Enable automatic layout switcher
let g:XkbSwitchEnabled = 1

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fix_on_save = 1

let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

let g:ale_fixers = {
\   'cpp': ['clangtidy'],
\   'python': ['isort', 'black'],
\   'scss': ['prettier'],
\   'rust': ['rustfmt'],
\   'php': ['php_cs_fixer'],
\   'go': ['goimports'],
\}

let g:ale_linters = {
\   'python': [],
\   'go': ['golint'],
\}

let g:EditorConfig_exclude_patterns = ['fugitive://.\*']

" Disabling hiding stuff in Markdown files
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:vim_markdown_frontmatter = 1

" Integrate with chezmoi
"autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %

" FZF ---------------------------

nmap <leader>fl :Files<cr>|     " fuzzy find files in the working directory (where you launched Vim from)
nmap <leader>/ :BLines<cr>|    " fuzzy find lines in the current file
nmap <leader>b :Buffers<cr>|   " fuzzy find an open buffer
nmap <leader>rf :Rg |           " fuzzy find text in the working directory
nmap <leader>rr :RG |           " fuzzy find text in the working directory
nmap <leader>c :Commands<cr>|  " fuzzy find Vim commands (like Ctrl-Shift-P in Sublime/Atom/VSC)
nmap <leader>h :History:<cr>|  " fuzzy find Vim commands history

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -uu --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg -uu --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" FZF ---------------------------


" Vista -------------------------
"
let g:vista_sidebar_width = 65
let g:vista_update_on_text_changed = 1
" let g:vista_default_executive = 'coc'

" Disable running Vista on startup by airline
" let g:airline#extensions#vista#enabled = 0

autocmd FileType vista,vista_kind nnoremap <buffer> <silent> /
  \ :<c-u>call vista#finder#fzf#Run()<CR>

nmap <leader>v :Vista!!<CR>
"
" Vista -------------------------

" Functions ---------------------

" https://vim.fandom.com/wiki/Deleting_a_buffer_without_closing_the_window
"here is a more exotic version of my original Kwbd script
"delete the buffer; keep windows; create a scratch buffer if no buffers left
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified.  Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

nmap <C-W>! <Plug>Kwbd

" Inplace encode and decode base64
vnoremap <leader>64e c<c-r>=system('base64 --wrap=0', @")<cr><esc>
vnoremap <leader>64d c<c-r>=system('base64 --wrap=0 --decode', @")<cr><esc>

endif
