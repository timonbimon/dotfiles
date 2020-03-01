" ------------------------------------------------------------------

"   -------------------------------
"   1.  GENERAL CONFIGURATION
"   -------------------------------

"   Activate vim-plug
"   ------------------------------------------------------------
    call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'terryma/vim-multiple-cursors'
    call plug#end()

"   Set-up relative and absolute line number handling
"   ------------------------------------------------------------
    set number
    set relativenumber


"   General settings
"   ------------------------------------------------------------
    set nowrap        " don't wrap lines
    set tabstop=2     " a tab is two spaces
    set shiftwidth=2  " number of spaces to use for autoindenting
    set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
    set backspace=indent,eol,start
                         " allow backspacing over everything in insert mode
    set autoindent    " always set autoindenting on
    set copyindent    " copy the previous indentation on autoindenting
    set smarttab      " insert tabs on the start of a line according to
                      "    shiftwidth not tabstop
    set expandtab
    set showmatch     " set show matching parenthesis
    set ignorecase    " ignore case when searching
    set smartcase     " ignore case if search pattern is all lowercase,
    		      "    case-sensitive otherwise
    set hlsearch      " highlight search terms
    set incsearch     " show search matches as you type
    set clipboard=unnamed
    					" let * register be available for copying to clipboard
    set encoding=utf-8



"   Key mappings
"   ------------------------------------------------------------
    " change the mapleader from \ to space
    let mapleader=" "
    map <Space> <Nop>

    " (v)imrc (e)dit
    " (v)imrc (r)eload
    nmap <silent> <leader>ve :e $MYVIMRC<CR>
    nmap <silent> <leader>vr :so $MYVIMRC<CR>

    " Make 0 go to the first character rather than the beginning
    " of the line. When we're programming, we're almost always
    " interested in working with text rather than empty space. If
    " you want the traditional beginning of line, use ^
    nnoremap 0 ^
    nnoremap ^ 0
    nnoremap L $
    nnoremap H ^

    " copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
    " this is helpful to paste someone the path you're looking at
    nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
    nnoremap <silent> <leader>cn :let @* = expand("%:t")<CR>

    "Clear current search highlight by double tapping //
    nmap <silent> // :nohlsearch<CR>


"   surround.vim
"   ------------------------------------------------------------
    " Surround a word with "quotes"
    map <leader>" ysiw"
    vmap <leader>" c"<C-R>""<ESC>

    " Surround a word with 'single quotes'
    map <leader>' ysiw'
    vmap <leader>' c'<C-R>"'<ESC>

    " Surround a word with (parens)
    " The difference is in whether a space is put in
    map <leader>( ysiw(
    map <leader>) ysiw)
    vmap <leader>( c( <C-R>" )<ESC>
    vmap <leader>) c(<C-R>")<ESC>

    " Surround a word with [brackets]
    map <leader>] ysiw]
    map <leader>[ ysiw[
    vmap <leader>[ c[ <C-R>" ]<ESC>
    vmap <leader>] c[<C-R>"]<ESC>

    " Surround a word with {braces}
    map <leader>} ysiw}
    map <leader>{ ysiw{
    vmap <leader>} c{ <C-R>" }<ESC>
    vmap <leader>{ c{<C-R>"}<ESC>

"   Strip trailing whitespace
"   ------------------------------------------------------------
   function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
   endfunction
   autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
