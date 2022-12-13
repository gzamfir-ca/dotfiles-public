" Setup vim package manager
set nocompatible
call plug#begin()
Plug 'sheerun/vim-polyglot'
call plug#end()

" Setup main visual outlook
set cursorline
set display=lastline
set hidden
set hlsearch
set incsearch
set laststatus=2
set number
set report=0
set showcmd
set showmode
set splitbelow
set synmaxcol=200
set wrapscan

" Setup interface behaviour
set autoindent
set backspace=indent,eol,start
set expandtab
set mouse=a
set softtabstop=2
set shiftwidth=2
set shiftround

" Setup temp file locations
set backup
set backupdir=/Users/georgezamfir/.vim/files/back/
set backupext=-back
set backupskip=
set directory=/Users/georgezamfir/.vim/files/swap//
set updatecount=100
set updatetime=2000

" Setup external shell prog
set shell=/bin/bash
