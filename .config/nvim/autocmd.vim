" Highlight after yanking
augroup Yanking
    autocmd!
    autocmd TextYankPost * lua require("vim.highlight").on_yank({timeout = 300, on_visual = false})
augroup END

augroup CIndentation
    autocmd!
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set tabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set softtabstop=2
    autocmd FileType c,cpp,objc,objcpp,lua,php,javascript,html,css set shiftwidth=2
augroup END

" For c like files, clang formatting insist using 2 spaces
augroup NonCIndent
    autocmd!
augroup END

" Vim wiki
augroup VimWikiGroup
    autocmd!
    autocmd Filetype vimwiki set tabstop=2
    autocmd Filetype vimwiki set softtabstop=2
    autocmd Filetype vimwiki set shiftwidth=2
augroup END

augroup KEYWORDS_HL
    autocmd!
    autocmd Syntax * call matchadd(
        \ 'Search',
        \ '\v\W\zs<(NOTE|DEADLINE|INFO|WARNING|DESCRIPTION)>'
        \ )

augroup END
