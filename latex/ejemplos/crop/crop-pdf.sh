#!/bin/bash


get_tex () {
    INFILENAME=$1
    DOC_CLASS=a4paper
    
    # legalaper, a4paper, letterpaper, landscape or portrait
    echo \\documentclass[${DOC_CLASS}]{minimal}
    ## ratio legalpaper: 1.643. For --nup 3x1:
    ## ratio: .55
    ## \\usepackage[paperwidth=500pt,paperheight=800pt]{geometry}
    echo \\usepackage{pdfpages}
    echo \\usepackage{ifthen}

    echo \\newcounter{pg} #counter of pages
    echo \\begin{document}
    echo \\setcounter{pg}{1} #fix the first page

    ## get width and heigth in points with pdfinfo eg: 540 x 666
    ## get num of pages with pdfinfo, eg: 892

    echo "\\whiledo{\\value{pg} < 9}{" ## 9 es pdf_len
    ## viewport=  w0   h0   w-max h-max
    # echo \\includepdf[pages=\\thepg,viewport=30 200 420 400]{${INFILENAME}}

    printf "\t%s\n" "\\includepdf[pages=\\thepg,viewport=30 200 420 400]{${INFILENAME}}"
    printf "\t%s\n" "\\addtocounter{pg}{1}" #page increment
    echo "}"
    echo \\end{document}
}


get_tex "${*}"
 
