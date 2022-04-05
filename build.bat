:: build.bat
:: Copyright © 2018-2022 NextStep IT Training, a division of Smallrock Internet Services, Inc. All rights reserved.
::
:: Build workbook, slides, and outline and copy the PDFs to the Distribution folder. Build clean will remove the
:: latex temporary folders and the pdfs from the Distribution folder.
::

@ECHO OFF

set cwd=%cd%
set coursenumber="ns00300"

if "%1" == "all" (
    call :all
) else if "%1" == "clean" (
    call :clean
) else if "%1" == "outline" (
    call :outline
) else if "%1" == "slides" (
    call :slides
) else if "%1" == "workbook" (
    call :workbook
) else (
    call :usage
)

cd "%cwd%"
exit /b

:usage
    echo "usage: build [workbook|slides|outline|all|clean]"
    goto :eof

:all
    call :workbook
    call :slides
    call :outline
    goto :eof

:workbook
    cd "%cd%\Workbook" & latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -output-directory=.\.latex-temp workbook.tex & copy .\.latex-temp\workbook.pdf ..\Distribution\%coursenumber%-workbook.pdf
    goto :eof

:slides
    cd "%cd%\Workbook" & latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -output-directory=.\.latex-temp workbook-slides.tex & copy .\.latex-temp\workbook-slides.pdf ..\Distribution\%coursenumber%-workbook-slides.pdf
    goto :eof

:outline
    cd "%cd%\Outline" & latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -output-directory=.\.latex-temp outline.tex & copy .\.latex-temp\outline.pdf ..\Distribution\%coursenumber%-outline.pdf
    goto :eof

:clean
    :: del /f/q .\Distribution\*.pdf
    rmdir /s/q .\Outline\.latex-temp
    rmdir /s/q .\Workbook\.latex-temp
    goto :eof
