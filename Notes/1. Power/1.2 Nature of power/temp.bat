@echo off
title Export MD to TEX
echo Bienvenue sur le convertisseur Markdown en TeX
mkdir %1-folder
pandoc %1 -f markdown -t latex -s -o %1-export.tex -V geometry:margin=1.5in
move %1-export.tex %1-folder
cd %1-folder
for /F "delims=" %%i in (%1) do pdflatex  "%%~ni.md-export.tex"
for /F "delims=" %%i in (%1) do move "%%~ni.md-export.pdf" ..