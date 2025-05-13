augroup exe_code
    autocmd!

    " compile and run code in terminal
    autocmd FileType python nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && python3 %<CR> :startinsert<CR>

    autocmd FileType c nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && gcc % -o %< && ./%< <CR> a

    autocmd FileType cpp nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && g++ % -o %< && ./%< <CR> a

    autocmd FileType javascript nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && nodejs %<CR> :startinsert<CR> a

    autocmd FileType java nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && javac % && java %< <CR> a
    
    autocmd FileType rust nnoremap <C-M>
                \ <C-w>h :term cd %:p:h && rustc % && ./%< <CR>

    " compile and using arguments before executing in terminal
    autocmd FileType python nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && python3 %<CR> :startinsert

    autocmd FileType c nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && gcc % -o %< && ./%<

    autocmd FileType cpp nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && g++ % -o %< && ./%<

    autocmd FileType javascript nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && nodejs %<CR> :startinsert

    autocmd FileType java nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && javac % && java %<
    
    autocmd FileType rust nnoremap <C-B>
                \ <C-w>h :term cd %:p:h && rustc % && ./%<

    autocmd FileType html nnoremap <C-B>
                \ :term firefox % <CR>

augroup END
