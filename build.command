#!

fileName=main

control_c() 
{
	rm *.aux
	rm *.bbl
	rm *.blg
	rm *.log
	rm *latexmk
	rm *.fls
	rm *.synctex.gz
	rm *.out
	find . -name "*converted-to.pdf" -type f -delete

	if [ -d ".git" ]; then
	git add -u
	fi
}

trap control_c SIGINT

if [[ $(uname) = Linux ]]; then

	okular   ./$fileName.pdf > /dev/null 2>&1 &
	subl ./$fileName.tex > /dev/null 2>&1 &

	sleep 2
	latexmk -c
	latexmk -pvc -xelatex -synctex=1 -silent ./$fileName.tex 

fi


if [[ $(uname) = Darwin ]]; then
	ABSPATH=$(cd "$(dirname "$0")"; pwd)
	cd $ABSPATH

	open /Applications/Sublime\ Text.app/ --args  $ABSPATH/$fileName.tex -n $ABSPATH/ &
	open /Applications/Skim.app/ --args $ABSPATH/$fileName.pdf &

	sleep 2
	latexmk -c
	latexmk -pvc -f -xelatex -synctex=1 -silent $fileName.tex 
fi


