# Useful commands when writing a thesis in LaTeX

## doi2bib
This Bash function will return BibTex citations for every DOI passed (just the DOI, no prefixes nor URLs).

```
doi2bib() {
    for arg in $@; do
        curl -LH "Accept: application/x-bibtex" "http://dx.doi.org/$arg"
        echo
    done
}
```

## Compress a pdf with ghostscript

```
gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dNOPAUSE -dQUIET -dBATCH -sOutputFile=dissertation-compressed.pdf dissertation.pdf
```

## Crop a figure contained in a PDF

```
pdfcrop my.pdf
```

## LaTeX to plain tex

Perfect for spell and grammar checks. I used LanguageTool and Microsoft Word Online.

```
detex dissertation.tex > dissertation.txt
```