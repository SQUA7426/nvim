augroup exe_code
    autocmd!

    " compile and run code in terminal
    autocmd FileType python nnoremap <C-P>
                \ :term kitty --hold python3 % <CR>

    autocmd FileType c nnoremap <C-P>
                \ :term gcc % -o %< && kitty --hold ./%< <CR>

    autocmd FileType cpp nnoremap <C-P>
                \ :term g++ % -o %< && kitty --hold ./%< <CR>

    autocmd FileType javascript nnoremap <C-P>
                \ :term kitty --hold nodejs %<CR> :startinsert<CR>

    autocmd FileType html nnoremap <C-P>
                \ :term firefox % <CR>

    autocmd FileType lua nnoremap <C-P>
                \ :term lua % <CR>

    "autocmd FileType rust nnoremap <C-P>
    "            \ :term rustc % && ./%< <CR> a
    autocmd FileType tex nnoremap <C-P>
                \ :term cd %:p:h && pdflatex % && evince %<.pdf <CR>
    " compile and using arguments before executing in terminal
    autocmd FileType python nnoremap <C-B>
                \ :term cd %:p:h && python3 % 

    autocmd FileType c nnoremap <C-B>
                \ :term kitty cd %:p:h && gcc % -o %< && --hold ./%< 

    autocmd FileType cpp nnoremap <C-B>
                \ :term cd %:p:h && g++ % -o %< && kitty --hold ./%< 

    autocmd FileType javascript nnoremap <C-B>
                \ :term cd %:p:h && nodejs % 

    autocmd FileType java nnoremap <C-B>
                \ :term cd %:p:h && javac % && java %< 
    
    autocmd FileType rust nnoremap <C-B>
                \ :term cd %:p:h && rustc % && ./%< 
augroup END
