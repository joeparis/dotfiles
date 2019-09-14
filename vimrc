" enable 256 color mode
set t_Co=256

" themes are in /usr/share/vim/vim80/colors/
set background=dark
" https://github.com/lifepillar/vim-solarized8
""colorscheme solarized8
colorscheme slate
syntax on

" https://jeffkreeftmeijer.com/vim-number/
set number
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
