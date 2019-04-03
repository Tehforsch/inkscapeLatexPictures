# inkscapeLatexPictures
Mini script that creates standalone pdfs from eps/eps_tex files exported via inkscape.

Converts all .eps_tex files in the folder it is copied to. When first argument is specified
it determines the svgwidth (increasing it decreases the font size in the final pdf)

Details:
To export inkscape graphics with latex symbols:
Use normal latex symbols, no fontsize or anything needed
Export pictures as .eps with latex symbols (=eps + eps_tex)
Use this script in the folder where the eps_tex and eps lie.
This will create a latex document with a certain svgwidth and parse it as a standalone pdf. 
Simply include this pdf with \includegraphics
