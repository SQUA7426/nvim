augroup exe_code
    autocmd!

    " compile and run code in terminal
    autocmd FileType python nnoremap <C-P>
                \ :term python3 % <CR> a

    autocmd FileType c nnoremap <C-P>
                \ :term gcc % -o %< && ./%< <CR> a

    autocmd FileType cpp nnoremap <C-P>
                \ :term g++ % -o %< && ./%< <CR> a

    autocmd FileType javascript nnoremap <C-P>
                \ :term nodejs %<CR> :startinsert<CR> a

    "autocmd FileType java nnoremap <C-P>
    "            \ :term javac % && java %< <CR> a

    "autocmd FileType scala nnoremap <C-P>
    "            \ :term scalac % && scala % <CR> a
    
    autocmd FileType sc nnoremap <C-P>
                \ :term amm %:p <CR> a

    "autocmd FileType rust nnoremap <C-P>
    "            \ :term rustc % && ./%< <CR> a

    " compile and using arguments before executing in terminal
    autocmd FileType python nnoremap <C-B>
                \ :term cd %:p:h && python3 % 

    autocmd FileType c nnoremap <C-B>
                \ :term cd %:p:h && gcc % -o %< && ./%<  <CR> a

    autocmd FileType cpp nnoremap <C-B>
                \ :term cd %:p:h && g++ % -o %< && ./%< <CR> a

    autocmd FileType javascript nnoremap <C-B>
                \ :term cd %:p:h && nodejs % 

    autocmd FileType java nnoremap <C-B>
                \ :term cd %:p:h && javac % && java %< 
    
    autocmd FileType rust nnoremap <C-B>
                \ :term cd %:p:h && rustc % && ./%< 

    autocmd FileType html nnoremap <C-B>
                \ :term firefox % <CR>

    autocmd FileType lua nnoremap <C-B>
                \ :term lua % <CR>
augroup END
