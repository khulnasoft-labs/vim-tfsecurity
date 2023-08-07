""
" @usage {}
" Run tfsecurity against the current directory and populate the QuickFix list
command! Tfsecurity call s:tfsecurity()

""
" @usage {}
" Install the latest version of tfsecurity to %GOPATH/bin/tfsecurity
command! TfsecurityInstall call s:tfsecurityInstall()

""
" @usage {}
" Updates tfsecurity to the latest version, requires tfsecurity to be on the path
command! TfsecurityUpdate call s:tfsecurityUpdate()


" tfsecurity runs tfsecurity and prints adds the results to the quick fix buffer
function! s:tfsecurity() abort
  try
		" capture the current error format
		let errorformat = &g:errorformat

 		" set the error format for use with tfsecurity
		let &g:errorformat = '%f\,%l\,%m'

		" get the latest tfsecurity comments and open the quick fix window with them
		cgetexpr system('tfsecurity --format csv --force-all-dirs --exclude-downloaded-modules 2>/dev/null | grep -v ''file,start_line,'' | awk -F, ''{print $1","$2",["$5"] " $6}'' | sort ') | cw
		call setqflist([], 'a', {'title' : ':Tfsecurity'})
	finally
		" restore the errorformat value
		let &g:errorformat = errorformat
  endtry
endfunction

" tfsecurityInstall runs the go install command to get the latest version of tfsecurity
function! s:tfsecurityInstall() abort
	try 
		echom "Downloading the latest version of tfsecurity"
    let installResult = system('go install github.com/khulnasoft-labs/tfsecurity/cmd/tfsecurity@latest')
		if v:shell_error != 0
    	echom installResult
		else
			echom "tfsecurity downloaded successfully"
		endif
	endtry
endfunction

" tfsecurityUpdate will update existing tfsecurity 
function! s:tfsecurityUpdate() abort
	try 
		echom "Updating to the latest version of tfsecurity"
    echom system('tfsecurity --update')
	endtry
endfunction
