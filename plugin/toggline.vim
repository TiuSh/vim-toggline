" toggline.vim
" Helper functions
"
" Maintainer: TiuSh <masy.mathieu@gmail.com>
" Version:    1.0.0
"
" Changelog:
" 1.0.0 - Initial plugin

if exists('loaded_togglin')
  finish
endif
let loaded_toggline = 1

" Trim helper function
function! s:trim(s) "{{{
  return substitute(a:s, '^\_s*\(.\{-}\)\_s*$', '\1', '')
endfunction "}}}

" Toggle the current line using the given expresions and substitutions
"
" enabledPat    {string}  Pattern on which the line will be tested. If it
"                         matches, the line will be considered as "enabled"
"                         and this pattern will be replaced by the
"                         "disableSub" argument.
" disableSub    {string}  Substition string applied on enablePat if the
"                         line is considered "enabled"
" disabledPat   {string}  If the line is considered as "disabled", this
"                         pattern will be replaced by the "enableSub"
"                         argument.
" enableSub     {string}  Substition string applied with the enablePat if the
"                         line is considered "disabled"
function! toggline#With(enabledPat, disableSub, disabledPat, enableSub) "{{{
  let l:line = getline('.')

  if (matchstr(l:line, a:enabledPat) == '')
    let l:toggledLine = substitute(l:line, a:disabledPat, a:enableSub, '')
  else
    let l:toggledLine = substitute(l:line, a:enabledPat, a:disableSub, '')
  endif

  call setline('.', l:toggledLine)
endfunction "}}}

" Toggle the given string at the end of the line.
"
" str   {string}  String that will be toggled
function! toggline#End(str) "{{{
  let l:trimedStr = s:trim(a:str)

  call toggline#With('\s*' . escape(l:trimedStr, '/\') . '\(\s*\)$', '\1', '\(\s*\)$', escape(a:str, '/\') . '\1')
endfunction "}}}

" Toggle the given string at the beginning of the line.
"
" str   {string}  String that will be toggled
function! toggline#Start(str) "{{{
  let l:trimedStr = s:trim(a:str)

  call toggline#With('^\(\s*\)' . escape(l:trimedStr, '/\') . '\s*', '\1', '^\(\s*\)', '\1' . escape(a:str, '/\'))
endfunction "}}}
