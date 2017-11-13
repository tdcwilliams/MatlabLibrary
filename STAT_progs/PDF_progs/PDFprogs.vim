let SessionLoad = 1
if &cp | set nocp | endif
nmap + :ZoomIn
map ,c :close   
map ,f :rew
map ,p :previous
map ,n :next
map ,[ 0f=i	la j
map ,u :source ~/.vimrc   "run .vimrc
map ,e :e ~/.vimrc        "open .vimrc
map ,v :sp ~/.vimrc       "split-open .vimrc
nmap - :ZoomOut
nnoremap : ;
nnoremap ; :
map [ 0f=i	j
map <silent> \mm :ShowMarksPlaceMark
map <silent> \ma :ShowMarksClearAll
map <silent> \mh :ShowMarksClearMark
map <silent> \mo :ShowMarksOn
map <silent> \mt :ShowMarksToggle
let s:cpo_save=&cpo
set cpo&vim
map \mbt <Plug>TMiniBufExplorer
map \mbu <Plug>UMiniBufExplorer
map \mbc <Plug>CMiniBufExplorer
map \mbe <Plug>MiniBufExplorer
map <silent> \bv :VSBufExplorer
map <silent> \bs :SBufExplorer
map <silent> \be :BufExplorer
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map! ,= 	= 
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=2
set noequalalways
set expandtab
set guifont=-adobe-courier-bold-r-normal--17-120-100-100-m-100-iso8859-10
set helplang=en
set hlsearch
set mouse=a
set report=1
set shiftwidth=3
set showmatch
set softtabstop=3
set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.asv
set visualbell
set wrapmargin=8
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/matlab-library/STAT_progs/PDF_progs
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 PDF_normalised_hist.m
badd +0 PDF_powerlaw_getprams.m
badd +0 PDF_powerlaw_pdf.m
badd +0 PDF_powerlaw_prob.m
badd +0 PDF_powerlaw_rand.m
badd +5 PDF_rayleigh_getprams.m
badd +1 PDF_rayleigh_pdf.m
badd +6 PDF_rayleigh_prob.m
badd +7 PDF_rayleigh_rand.m
badd +0 PDF_SplitPowerLaw_getprams.m
badd +0 PDF_SplitPowerLaw_pdf.m
badd +0 PDF_SplitPowerLaw_prob.m
badd +0 PDF_SplitPowerLaw_rand.m
badd +0 PDF_TruncPowerLaw_getprams.m
badd +0 PDF_TruncPowerLaw_pdf.m
badd +0 PDF_TruncPowerLaw_prob.m
badd +0 PDF_TruncPowerLaw_rand.m
badd +11 ~/matlab-library/STAT_progs/PDF_progs/PDF_exponential_prob.m
badd +16 PDF_exponential_getprams.m
badd +1 PDF_exponential_pdf.m
badd +1 PDF_exponential_rand.m
args PDF_normalised_hist.m PDF_powerlaw_getprams.m PDF_powerlaw_pdf.m PDF_powerlaw_prob.m PDF_powerlaw_rand.m PDF_rayleigh_getprams.m PDF_rayleigh_pdf.m PDF_rayleigh_prob.m PDF_rayleigh_rand.m PDF_SplitPowerLaw_getprams.m PDF_SplitPowerLaw_pdf.m PDF_SplitPowerLaw_prob.m PDF_SplitPowerLaw_rand.m PDF_TruncPowerLaw_getprams.m PDF_TruncPowerLaw_pdf.m PDF_TruncPowerLaw_prob.m PDF_TruncPowerLaw_rand.m
edit PDF_exponential_rand.m
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
edit PDF_exponential_rand.m
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal completefunc=
setlocal nocopyindent
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'matlab'
setlocal filetype=matlab
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=2
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=GetMatlabIndent(v:lnum)
setlocal indentkeys=!,o,O=end,=case,=else,=elseif,=otherwise,=catch
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal modeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal noscrollbind
setlocal shiftwidth=3
setlocal noshortname
setlocal nosmartindent
setlocal softtabstop=3
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=
setlocal suffixesadd=.m
setlocal swapfile
setlocal synmaxcol=3000
if &syntax != 'matlab'
setlocal syntax=matlab
endif
setlocal tabstop=8
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=8
silent! normal! zE
let s:l = 16 - ((15 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
16
normal! 017l
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . s:sx
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
