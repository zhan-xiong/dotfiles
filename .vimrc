set ts=2
set sw=2
set autoindent
set expandtab
set backupcopy=yes
filetype plugin indent on
syntax on
command! -nargs=* -bar -bang -count=0 -complete=dir E Explore <args>

execute pathogen#infect()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" fzf
nnoremap <c-p> :FZF<cr>
