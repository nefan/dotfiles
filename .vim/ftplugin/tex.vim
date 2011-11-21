" this is mostly a matter of taste. but LaTeX looks good with just a bit
" " of indentation.
set sw=2
" " TIP: if you write your \label's as \label{fig:something}, then if you
" " type in \ref{fig: and press <C-n> you will automatically cycle through
" " all the figure labels. Very useful!
set iskeyword+=:

" tex textwidth
"autocmd! BufRead,BufNewFile *.tex     set textwidth=80
"autocmd! BufRead,BufNewFile *.tex     set autowrite
set textwidth=80
set autowrite
set spell

let g:Imap_UsePlaceHolders = 0

" search
let g:Tex_UseEditorSettingInDVIViewer = 1
let g:Tex_CompileRule_dvi = 'latex -src-specials -interaction=nonstopmode $*'
"let g:Tex_ViewRule_dvi = 'xdvi -editor "gvim --servername '.v:servername.' --remote +\%l \%f"'
let g:Tex_ViewRule_dvi = 'xdvi'

if (system("echo -n `cat *.tex.latexmain`") =~ 'beamer')
    "unlet g:Tex_FormatDependency_pdf
    "let g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
    let g:Tex_DefaultTargetFormat = 'pdf'
endif

" warnings
let g:Tex_IgnoredWarnings = 'Underfull'."\n"
        \ . 'Overfull'."\n"
        \ . 'specifier changed to'."\n"
        \ . 'You have requested'."\n"
        \ . 'Missing number, treated as zero.'."\n"
        \ . 'Marginpar on page'."\n"
        \ . 'Font Warning:'."\n"
        \ . 'There were undefined references'."\n"
        \ . 'Citation %.%# undefined'
let g:Tex_IgnoreLevel = 7

"avoid hit enter when reverse searching
set laststatus=2 cmdheight=2 
