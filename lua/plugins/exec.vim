augroup exe_code
    autocmd!
    
    " compile and run code in terminal
    autocmd FileType python nnoremap <C-M>
                \ <C-w>v :term cd ./ && python3 %<CR> :startinsert<CR> a

    autocmd FileType c nnoremap <C-M>
                \ <C-w>v :term cd ./ && gcc % -o %< && /.//%< <CR> a

    autocmd FileType cpp nnoremap <C-M>
                \ <C-w>v :term cd ./ && g++ % -o %< && /.//%< <CR> a

    autocmd FileType javascript nnoremap <C-M>
                \ <C-w>v :term cd ./ &&  nodejs %<CR> :startinsert<CR> a

    autocmd FileType java nnoremap <C-M>
                \ <C-w>v :term cd ./ && javac % && java %< <CR> a
    
    autocmd FileType rust nnoremap <C-M>
                \ <C-w>v :term cd ./ && rustc % && /.//%< <CR> a

    " compile and using arguments before executing in terminal
    autocmd FileType python nnoremap <C-N>
                \ <C-w>v :term cd ./ && python3 %<CR> :startinsert

    autocmd FileType c nnoremap <C-N>
                \ <C-w>v :term cd ./ && gcc % -o %< && /.//%<

    autocmd FileType cpp nnoremap <C-N>
                \ <C-w>v :term cd ./ && g++ % -o %< && /.//%<

    autocmd FileType javascript nnoremap <C-N>
                \ <C-w>v :term cd ./ &&  nodejs %<CR> :startinsert

    autocmd FileType java nnoremap <C-N>
                \ <C-w>v :term cd ./ && javac % && java %<
    
    autocmd FileType rust nnoremap <C-N>
                \ <C-w>v :term cd ./ && rustc % && /.//%<




augroup END
