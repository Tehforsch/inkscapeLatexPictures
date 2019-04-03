#!/bin/bash

if [[ $# -eq 1 ]]; then
    echo $1
    svgwidth=$1
else
    svgwidth=5
fi

for filenameeps in *.eps_tex; do
    echo $filenameeps
    filename=${filenameeps/\.eps_tex/}
    echo $filename
    if [[ -a $filename.tex ]]; then
        echo "WILL NOT OVERWRITE $filename.tex"
        exit 0
    fi
    echo "" > $filename.tex
    echo "\\documentclass{standalone}" >> $filename.tex
    echo "\\usepackage{graphicx}" >> $filename.tex
    echo "\\usepackage{color}" >> $filename.tex
    echo "\\usepackage[english]{babel}" >> $filename.tex
    echo "\\usepackage{inputenc}" >> $filename.tex
    echo "\\usepackage[utf8]{luainputenc}" >> $filename.tex
    echo "\\begin{document}" >> $filename.tex
    echo "\\def\\svgwidth{${svgwidth}cm}" >> $filename.tex
    echo "\\input{$filename.eps_tex}}" >> $filename.tex
    echo "\\end{document}" >> $filename.tex
    rm ${filename}.pdf
    pdflatex --interaction=nonstopmode ${filename}.tex
    rm ${filename}.tex
    rm ${filename}.aux
    rm ${filename}-eps-converted-to.pdf
    rm ${filename}.log
done
