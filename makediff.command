#!

fileName=main

if [[ $(uname) = Darwin ]]; then
	echo Darwin
	ABSPATH=$(cd "$(dirname "$0")"; pwd)
	cd $ABSPATH
	./git-latexdiff --main ./$fileName.tex 9700d8c --output ./diff.pdf --latexdiff-flatten --ignore-latex-errors --exclude-textcmd="section,subsection,subsubsection,algorithm,equation,eqnarray"

fi