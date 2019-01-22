![](.common/nsbanner.png?raw=true)

# Standard Course Template

## Introduction

This course template provides standard structure and technology for managing and dstribution courseware.
The three areas of focus are written material, participant files, and video presentations.

Over the years our choice of formatting tools has evolved, and we are back at an old standby, LaTeX.
The learning curve for LaTex appears higher if you go look at it because it is text-based and not what-you-see-is-what-you-get.
But in fact, the structure of these LaTeX documents is such that you really do not need to know much about LaTeX at all!

All that is really necessary is to understand where to put image files and how to use the macros that have been defined for you.
You should simply be able to plug your content into the templates and everything will work.
Note: $ and & are sometimes special characters in the LaTeX world; escape them by putting a backslash in front of them in your text.

So, it really is not any more difficult to use for this template than HTML, XML, or Markdown.
In fact, it is much simpler, you just have to learn our handful of macros, and a couple of LaTeX things like:
wrap text with *\textbf{...}* for bold characters, and *\textit{...}* for italics (replace the elipses with your text).
The rest of what you need to know comes below.

And, best of all, it is definiately faster than trying to fight with a WYSIWIG editor (but you can use one if you want to)!

## License

The course template is licensed under the MIT license. The corresponding courseware when developed is not. You may use and modify all or part of it as you choose, as long as attribution to the source is provided per the license. See the details in the [license file](./LICENSE.md) or at the [Open Source Initiative](https://opensource.org/licenses/MIT)

## Installing LaTeX

LaTex is a text-based typesetting language with definable macros and is perfect for developing course material.
Comparable in technique to HTML, XML, or Markdown, with supporting tools almost any outcome may be targeted
including PDF and e-publishing formats.

Visit this page at the official Latex Project for details about how to install the tool: https://www.latex-project.org/get/.
Note: on MacOS MacTex may also be installed through Homebrew:

```text
$ brew tap caskroom/cask
$ brew cask install mactex
```

Visual Studio Code from Microsoft is an excellent tool for editing course projects, it works in all of the major operating system environments: Windows, MacOS, and Linux.
VSCode was used to build this template project.
You may want to add the "LaTeX Workshop" extension by James Yu, it helps with compiling the source files and has a built-in PDF previewer.
You may also want the "Spelling Checker (RU, EN)" by Julia to help avoid gramatical and spelling errors.

When you use VSCode and the LaTeX Workshop, in the settings for LaTeX Workshop add an output-directory for building the LaTeX sources.
The path is relative to the folder where the .tex source file is located:

```json
"latex-workshop.latex.tools": [
    {
        "name": "latexmk",
        "command": "latexmk",
        "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-pdf",
        "-output-directory=./.latex-temp",
        "%DOC%"
        ]
    },
    {
        "name": "pdflatex",
        "command": "pdflatex",
        "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-output-directory=./.latex-temp",
        "%DOC%"
        ]
    },
```

Without this setting, the compiler files are placed alongside the .tex files, cluttering up the project!


## Project Steps

The course project starts as a single Git repository, but will be split into two repositories immediately after cloning this project.
The main project will still be in the primary repository, but the directory that lives under Student_Files will be converted into a separate repository.
This will allow the student files to be distributed through GitHub as a separate project, directly to class participants.

We keep the student files repository as a submodule of the course respository first to effectively tie it to the course, and
more importantly because it makes the source available in the same project while course material is being worked on.

These instructions assume a basic familiarity with Git.

### Create the Student Files Repository

1. Clone this project into a new course project on your local computer.
2. Use the command *git rm -r --cached Student_Files/Rename-Me* in the project to remove that folder from Git control (--cached leaves the actual folder intact).
3. Move to the *Student_Files/Rename-Me* folder and run *git init* to turn it into a Git project.
4. Update the README.md and LICENSE.md files; the instructions in them are self-evident.
5. Change the name of each *01_Rename-Me* folder in *Examples*, *Resources*, and *Solutions* to match the first chapter name.
6. In the new project folder (it should still be *Student_Files/Rename-Me*) use *git add --all* to add everything to the Git staging area (the *index*).
7. Commit the staging area with *git commit -m "Initial commit of student file project."*.
8. Change the name of the folder *Student_Files/Rename-Me* to the course title.
9. Create a remote *origin* repository for the student files (probably at GitHub).
10. Add the new *origin* remote to the project: *git remote add origin <New-Student-Files-Origin-URI>*.
11. Push the local repository to the remote (it should have only the master branch).
12. Use an appropriate branching scheme of your choice for development of the student files project: GitFlow, Trunk Based Development, etc.

### Update the Course Repository

12. Move to the course repository folder.
13. Link the new student files origin to course respository with *git submodule add <New-Student-Files-Origin-URI>*. Use the URI to the origin, not the local copy, so that if this repository is cloned it will point to the origin for the student files.
14. Move to the *Workbook* folder.
15. Use *git mv 01_Rename-me 01_<new chapter name>* and rename the first chapter.
16. Edit the *workbook-chapters.tex* file and change the name of the first chapter where it is used to link to the subfiles (there are four links).
17. Use *git status* to make sure that Git has the submodule link and the modified *workbook-chapters.tex* file in the staging area.
18. Commit the staging area with *git commit -m "Initial commit of course <course name>."*.
19. Use *git remote -v* to list the current remote repositories, and if there are any use *git remote remove <name>* to remove each one.
20. Create a new remote *origin* repository for the course project at whatever provider you use for private repositories: GitHub? GitLab?.
21. Add the new *origin* remote to the project: *git remote add origin <New-Course-URI>*.
22. Push the local repository to the remote (it should have only the master branch).
11. Use an appropriate branching scheme of your choice for development of the course project: GitFlow, Trunk Based Development, etc.
12. Before you publish an actual release, replace this file with a README.md that describes the project (we assume you need to keep it around for now to help you develop the course material).

The remainder of this document describes the project structure and how to build out the course.

## Project Structure

|Folder|Description|
|---|---|
|.common|Contains assets for README.md|
|Distribution|This folder contains the outcome products; usually this includes the PDF of the participant workbook, a PDF of the slide presentation, video outputs, etc.|
|Multimedia|Scripts and audio-video files for multimedia presentation of the material. This material should probably be arranged by chapter to parallel the workbook folder below.|
|Resources||
|└──&nbsp;Documents|Local and third-party documents about the course.|
|└──&nbsp;Graphics|Source graphics used in the course, both local and third-party.|
|Student_Files||
|└──&nbsp;[Course Name]|A separate git project in a folder named as the course.|
|Workbook||
|└──&nbsp;_Images|A single collection of all images used in the workbook. Experience guides that this works better when all the images are placed in the same folder, instead of sub-folders or trying to put the images in the chapter folders.|
|└──&nbsp;_Preamble|*workbook-def.tex* contains the workbook definitions and macros.|
|└──&nbsp;.latex&#8209;temp|Output folder created during LaTeX compilation.|
|└──&nbsp;00_Front&#8209;Matter|Foreword, introduction, preface, and prelude sections.|
|└──&nbsp;01_Overview|Each chapter is numbered and titled.|
|&nbsp;&nbsp;&nbsp;&nbsp;└──&nbsp;section-0.tex|The chapter header.|
|&nbsp;&nbsp;&nbsp;&nbsp;└──&nbsp;section-1.tex|Each chapter section is numbered.|
|&nbsp;&nbsp;&nbsp;&nbsp;└──&nbsp;section-lab.tex|The lab section.|
|└──&nbsp;workbook&#8209;chapters.tex|This LaTeX document organizes the chapter sections and is used for both the book and slides.|
|└──&nbsp;workbook&#8209;slides.tex|This defines the structure of the slide document.|
|└──&nbsp;workbook.tex|This defines the structure of the book.|
|README.md|The contents of this document should be replaced with new information to reflect the project being released.

## Student_Files

The student files always follow the same structure, the top-level folder is named after the course and can co-exist side-by-side with the files from other courses.
This folder is the root of a separate Git project that is accessible publically by the students at https://github.com/nextstepitt.
Git will not merge the projects; if a .git folder exists in the student files course folder then its contents will ignored when commits are made to the course.
Instead, Git will add a reference to the student files project.
While it is a separate project, it is nested in the course project to make it easy to check or work on labs at the same time as the workbook.

The student files are layed out in a specific way:

```text
Student_Files
│
└── React_Programming_TS
    └── Examples
    │    └── 02_Components
    │    └── ...
    │ 
    └── Labs
    │       .gitignore
    │ 
    └── Resources
    │    └── 02_Components
    │    └── ...
    │ 
    └── Solutions
        └── 01_React
        └── 02_Components
        └── ...
```

* All courses have a unique named folder under Student_Files so they can exist side-by-side.
* The Labs folder is always an empty space to do your work. We want participants to work in this folder because it is adjacent to the *Resources* folder where we place any resources that they need for the lab work.
* The *Examples* and *Resources* folders parallel the structure of the *Solutions* folder, one folder for each chapter. These should follow the same names as are asigned to the chapters in the workbook.
* Empty folders contain an empty *.gitignore* file so that they are included in zip compression (normally empty folders are dropped).
* Make sure that any files that should not make it into the repository are put in .gitignore for the student files project. For example, if this is a NodeJS-based project, then the folder *node_modules/* should be ignored. The modules installed from the npmjs.com registry can always be re-installed when the project is cloned from Git, there is no reason to clutter up our repository with them (and node_modules is very likely to be large).

## Working with the Workbook

### Overview

The workbook is a multi-document project typeset initially to Acrobat PDF using LaTeX.
The structure of the LaTeX documents is such that you really do not need to know much about LaTeX.
All that is really necessary is to understand where to put image files and how to use the macros that have been defined for you!
You should simply be able to plug your content into the templates and everything will work.
Note: $ and & are sometimes special characters in the LaTeX world; escape them with a backslash in your text.

The workbook is divided into a preamble of LaTeX definitions for consistent course material, and a series of subfiles in each chapter of the book.
The book starts with a *00_Front-Matter* chapter that contains subfiles for:

* copyright.tex - the copyright page for the book
* foreword.tex - possibly a foreword written by a field expert
* introduction.tex - the author's introduction
* preface.tex - the author's preface
* prelude.tex - a description of the course (may make the introduction unnecessary), the class setup requirements, participant prerequisite requirements, an agenda for the class, and a rundown about facilities and class etiquite.

The copyright is boilerplate, but the title and copyright dates must be inserted, an ISBN number should be assigned before publication,
and the trademark list may need to be updated.

The foreword, introduction, and preface need to be written if they are to be included.

The prelude description, setup requirements, prerequisites, and agenda all need to be updated.

The "how to" for the workbook is broken into:

* [Sections](#Sections)
* [section-0.tex](#section-0.tex)
* [section-(1-n).tex](#section-(1-n).tex)
* [Images](#Images)
* [Code Blocks](#Code-Blocks)
* [Tables](#Tables)
* [Lists](#Lists)
* [Descriptive Text](#Descriptive-Text)
* [section-lab.tex](#section-lab.tex)

### Sections

Each chapter folder contains two or more LaTeX sections files: section-0.tex, section-1.tex, section-2.tex, section-3.tex section-lab.tex.
There may or not be a section-2 or section-3, but there should never be more than three sections (rule of threes).
The lab section is optional, it depends on the type of material being prepared. 

### section-0.tex

The *section-0.tex* file is the chapter title page, with four pieces: the title, a list of topics, a bullet list of objectives (no more than three), and a one
or two sentence overview of what the chapter is about.

```text
\chapter{[Insert Chapter Title]}

\begin{chaptertopics}
\topic{Topic One}
\topic{Topic Two}
\topic{Lab - [Insert Chapter Title]}
\end{chaptertopics}

\chapterobjectives

\begin{itemize}
\item First objective
\item Second objective
\item Third objective
\end{itemize}

\chapteroverview

[Describe what will be discussed in this chapter].
```

*\chapter* is pure LaTeX defining the chapter section and the title.
The macro has been redefined to place the chapter title right-aligned and vertically centered on the page.

The *chaptertopics* environment is defined in LaTeX to build a list of topics, right-aligned below the chapter title.
The *\topic* macro sets up each topic title correctly.

The chapter objectives are simply an itemized list, no periods.
There should be three objectives for the chapter, studies show that people handle things best in groups of three (the *rule of threes*).

### section-(1-n).tex

Each one of these files is a separate part of the chapter; there should be no more than three (rule of threes).

At the beginning of each section is the section title, which should match the corresponding title in the sectiontopics from the chapter title page in section-0.
*\sectiontopics* is almost the same macro as *\chaptertopics*, except that it is left aligned.
A new macro, *\topicselected*, is introduced to typeset the current topic in bold:

```text
\section{[Insert Section One Title]}

\begin{sectiontopics}
\topicselected{[ Insert Section One Title]}
\topic{[Insert Section Two Title]}
\topic{Lab - [Insert Chapter Title]}
\end{sectiontopics}
```

Each topic is identified with *\subsectiontopic*.
The subsections are made up of *figures*, *code blocks*, and/or *tables*, followed by a bullet list explaining the topic.

```text

\subsection{[Insert Topic One Title]}

\fig{nsbanner}

\begin{itemize}
\item This is the first bullet point of the topic
\item This is the second bullet point of the topic
\end{itemize}
```

Follow the template to set up the content of the sections:

#### Images

##### Including Images

```text
\fig{imagename}
```

A topic figure can be inserted using the *\fig* macro, where the argument is the name of the image.
Images are located realtive to the \graphicspath defined in each LaTeX file; this is set up in the template to point to the *Workbook/_Images*
regardless if LaTeX is compiling the whole book or an individual section file so leave it alone and put the images in *_Images*.

Image names do not include the file extension, LaTeX will figure out the right image just from the name.

*\fig* is defined to center the image on the page with some extra margin space around it.
When the slides are formatted, the image will be reduced in height and there will be considerable horizontal margins
to keep it on the slide.

##### How Images are Found

You do not need to know this to use the template, but it might be useful at some point to understand how the LaTeX compiler is finding
images in the source files:

```text
\providecommand{\main}{..}
\documentclass[../workbook]{subfiles}
\graphicspath{ {\main/_Images/} }
```

A problem exists, because compiling a LaTeX document in a chapter individually and compiling the whole book work differently.
Each section in a chapter is marked as a subfile of ../workbook, and that means the preamble is read from the ../workbook.tex file at the top of the document.
When the book is compiled the path graphics path is relative to the top of the Workbook folder, but when an individual file is compiled (as in a preview in the editor) the graphics path needs to be relative to the *parent* folder!

The lead-in for the section document fixes this by defining *\providecommand{\main}{..}*.
In the workbook.tex file *\main* is defined as ".", but in the section it is defined as "..".
However, when the workbook is compiled, the *\providecommand* in the section is ignored!
So, the change to ".." only takes place if the section is compiled by itself.

#### Code Blocks

Code blocks are set up in an easy-to-use LaTeX environment, *codeblock*:

```text
\begin{codeblock}{javascript}
const x = 5
const y = 6

console.log(x + y)
\end{codeblock}
```

This environment is built from the *mdbox* and *lstlistings* packages.
All that is necessary is to specify the coding language as the parameter to the block.
All of the languages defined for highlighting have strictly *lowercase* names.
The currently supported langagues are *javascript*, *typescript*, *jsx*, *tsx*, *c*, *c++*, *java*, *c#*, and *python*.
Also, *text* and *console* are plain text definitions without highlighting.
The definitions for these languages and new languages are always being added, and you can easily follow the definitions
in the *workbook-def.tex* file and the reference in the Listing document to change or add new stuff.

#### Tables

Tables can be a bit wordy to set up in LaTeX, and since they are supposed to look the same throughout the book
three macros have been created to reduce the structure to this:

```text
\topictable{|l|X|}{
\tableheader{Header Column One}{Header Column Two}
\tablerow{Row one, column one}{Row one, column two}
\tablerow{Row two, column one}{Row two, column two}
}
```

The first argument to the table macro defines how the columns will look, and is fed right into the *tabularx* package.
The vertical bars indicate that vertical bars should be on the borders of the table cells.
The letters indicate: *l* - align left an only use the necessary amount of space, *c* - align center, *r* - allign right, *X* distribute
the remaining space evently among all *X* columns.

The second argument between the braces at the beginning and end is the content of the table.
The table content should be one header row (it becomes bold text) and one or more table rows.
Each row has to have the same number of column arguments as the first argument defines columns.

#### Lists

Lists are pure LaTeX.
Almost every topic should have bullet points below an image, codeblock, or table.
The bullet list is created with an *itemize* environment.
Items should be simple, no periods because this encourages long points.
There should be one to three points, no more (rule of threes):

```text
\begin{itemize}
    \item This is the first point
    \item This is the second point
\end{itemize}
```

In the labs we use numbered lists.
Lists can be nested, which does happen sometimes in these situations.
LaTeX will switch from numbers to a, b, c for the second level.
Codeblocks can appear between list elements:

```text
\begin{enumerate}
    \item These are detailed project steps.
        \begin{enumerate}
            \item Lists may be nested.
            \item Second nested list item.
        \end{enumerate}
    \item Second outer list item.
    \begin{codeblock}{javascript}
    Code blocks may be inserted between items.
    \end{codeblock}%
    \item Third outer list item.
\end{enumerate}
```

#### Descriptive Text

If really necessary, a pure-LaTeX paragraph can be placed under a topic to provide
a detailed description.
We discourage the use of this in the text, the book is supposed to be a guide for the participants
and instructor, not a detailed instruction manual.

```text
\par{
    This is paragraph text.
}
```

### section-lab.tex

The lab section works slightly differently.
The subsections in the lab are not topics, and in the slides outcome they are not placed on separate pages.
Rather the subsections define the different information needed to complete the lab: *goals*, *synopsis*, *requirements*, *steps*, and *results*.

Look at the source to the section-lab.tex file, and it will become apparent how to define each part.

## Building and Publishing

The instructions for adding LaTeX to your system were provided at the [top of this document](#Installing-LaTeX).

### PDF

The basic book and slides are PDF files, try using these two commands to build them (the $ is the command prompt):

```text
$ latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -output-directory=./.latex-temp workbook.tex
$ latexmk -synctex=1 -interaction=nonstopmode -file-line-error -pdf -output-directory=./.latex-temp workbook-slides.tex
```

Changing the output directory keeps LaTeX from making all the compiled versions next to the original .tex files, but
it also means that workbook.pdf and workbook-slides.pdf will be placed in the .latex-temp folder.
.latex-temp is ignored by Git.
If the PDF files are the final publication versions for the current course version, then move them to the Distribution
folder before committing the version changes to the project.

We have also built these into an operating-system agnostic package.json file, so you can just run:

```text
$ npm run build
$ npm run build-slides
```

Warning: you may get a LaTeX compilation warning from the package scrlfile.sty: "Command \@footnotemark  has changed. Check if current package is valid."
This happens becauase of the way dependent packages are loaded in the source files.
You may also see warnings coming out of some of the other packages for similar reasons.
We have not found a way to fix these yet, or at least an easy way, so ignore them.

## Conclusion

Thank you for considering this standard template as a foundation for your courseware development.
This template is an ever-evolving project, and the technology we use changes frequently, so therefore the template does as well.
Check back, the current version will always offer you the best results, and that is what you are going to get anyways
if you follow the instructions to clone this repository when you start a new project.
Enjoy!