augroup exe_code
    autocmd!
    
    " compile and run code in terminal

    autocmd FileType python nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && python3 %<CR> :startinsert<CR>

    autocmd FileType c nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && gcc % -o %< && ./%< <CR> a

    autocmd FileType cpp nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && g++ % -o %< && ./%< <CR> a

    autocmd FileType javascript nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && nodejs %<CR> :startinsert<CR> a

    autocmd FileType java nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && javac % && java %< <CR> a
    
    autocmd FileType rust nnoremap <C-M>
                \ <C-w>v :term cd %:p:h && rustc % && ./%< <CR>

    " compile and using arguments before executing in terminal
    autocmd FileType python nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && python3 %<CR> :startinsert

    autocmd FileType c nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && gcc % -o %< && ./%<

    autocmd FileType cpp nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && g++ % -o %< && ./%<

    autocmd FileType javascript nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && nodejs %<CR> :startinsert

    autocmd FileType java nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && javac % && java %<
    
    autocmd FileType rust nnoremap <C-N>
                \ <C-w>v :term cd %:p:h && rustc % && ./%<
    " making o-file and compile then
    autocmd FileType c nnoremap <C-P>
                \ <C-w>v :term cd %:p:h && gcc -g -fno-stack-protector -c %
                \ && gcc %<.o -o %<
                \ && ./%< <CR> a
augroup END
