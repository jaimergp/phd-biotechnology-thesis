#!/bin/bash
cd $(dirname $1)
IN="$(basename $1)"
BASE="${IN%.*}"
OUT="$BASE"_compiled
rst2latex --section-numbering $IN | 
sed 's/%%% User specified packages and stylesheets.*/&\n\\usepackage{natbib}/;
s/\\hypersetup{.*/&\n  citecolor=black,/' > "$OUT".tex
pdflatex "$OUT".tex
bibtex "$OUT".aux
pdflatex "$OUT".tex
pdflatex "$OUT".tex

mv "$OUT".pdf "$BASE".pdf
rm -f "$OUT".*