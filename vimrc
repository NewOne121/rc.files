syntax on
set background=dark
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd BufNewFile,BufRead *[Jj]enk* setf groovy
autocmd BufNewFile,BufRead *groovy* setf groovy
set tabstop=2
set softtabstop=2
set expandtab
