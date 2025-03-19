augroup exe_code
    autocmd!

    autocmd FileType python nnoremap <C-M>
                \ <C-w>v :term python3 %<CR> :startinsert<CR> a

    autocmd FileType c nnoremap <C-M>
                \ <C-w>v :term gcc % -o %< && /.//%< <CR> a

    autocmd FileType cpp nnoremap <C-M>
                \ <C-w>v :term g++ % -o %< && /.//%< <CR> a

    autocmd FileType javascript nnoremap <C-M>
                \ <C-w>v :term nodejs %<CR> :startinsert<CR> a

    autocmd FileType java nnoremap <C-M>
                \ <C-w>v :term javac % && java %< <CR> a

augroup END
