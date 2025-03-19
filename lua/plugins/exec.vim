augroup exe_code
    autocmd!

    autocmd FileType python nnoremap <buffer> <C-M>
                \ <C-w>v :term python3 %<CR> :startinsert<CR>

    autocmd FileType c nnoremap <buffer> <C-M>
                \ <C-w>v :term gcc % -o %< && /.//%< <CR> a

    autocmd FileType cpp nnoremap <buffer> <C-M>
                \ <C-w>v :term g++ % -o %< && /.//%< <CR> a

    autocmd FileType javascript nnoremap <buffer> <C-M>
                \ <C-w>v :term nodejs %<CR> :startinsert<CR>

    autocmd FileType java nnoremap <buffer> <C-M>
                \ <C-w>v :term javac % && java %< <CR>

augroup END
