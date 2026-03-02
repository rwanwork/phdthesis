PhD Thesis
==========

LaTeX source code for my PhD thesis, submitted in late 2003 to the University of Melbourne.

Currently (2026) does not compile with recent versions of LaTeX...  Working on this and listing the necessary changes below.

At the Unviersity of Melbourne's library, you can access:
  * [record](http://cat.lib.unimelb.edu.au/record=b2867173)
  * [PDF download](https://hdl.handle.net/11343/38920)


Directory Organisation
----------------------

After cloning this repository from GitHub using the `git clone` command, the following file/directory structure is obtained:

.
├── src                      LaTeX source code for the thesis
└── submit                   Files submitted to the University of Melbourne library in 2004
    ├── 01front.pdf            Submitted front matter of the thesis (PDF on 2004/04/20)
    ├── 01front.ps             Submitted front matter of the thesis (Postscript, which was then converted to PDF)
    ├── 02whole.pdf            Submitted main part of the thesis (PDF on 2004/04/20)
    ├── 02whole.ps             Submitted main part of the thesis (Postscript, which was then converted to PDF)
    ├── phd.pdf                Entire thesis (PDF)
    └── phd.ps                 Entire thesis (Postscript)


Compiling
---------



List of changes
---------------

The list of changes to the original (i.e., where the original is the very first version in this Git repository) necessary to compile in 2026 are:

* Removed the deprecated [doublespace](https://ctan.org/pkg/doublespace?lang=en) and replaced it with the `\DoubleSpace` command from the Memoir class in `t.tex`.
* Downloaded [psboxit.sty](https://ctan.org/pkg/psboxit?lang=en).
* Removed `\setstretch{}` from the `\newchapter` command in `visual.sty`.
* Changed `\begin{algorithm}[boxed,tbp]` to `\begin{algorithm}[tbp]`.
* Changed `\dontprintsemicolon` to `\DontPrintSemicolon` in algorithm2e environments.
* Used `biber` instead of `biblatex` in `t.tex`, `packages.tex`, and `Makefile`.  The `natbib` and `citeref` packages were also removed from `packages.tex`.
* Renamed Chapter 1's `amper?.ps` to `.eps` (they were encapsulated PostScript files anyway).
* Newer version of LaTeX seems to disallow `\input{}` just the body of a table.  Column headers and captions of these tables have been moved from the chapter's main text to the file `\input{}` in:  
     * `ch03/woodchuck-short.tex`
     * `ch04/woodchuck-short-wa.tex`
     * `ch05/example2b-longph.tex`
     * `ch05/phraselinks.tex`


About PhD Thesis
----------------

The LaTeX source code for this thesis was written while I was at the University of Melbourne (submitted in 2003).  My contact details:

     E-mail:  rwan.work@gmail.com

My homepage is [here](http://www.rwanwork.info/).

The latest version can be downloaded from [GitHub](https://github.com/rwanwork/phdthesis).

If you have any information about bugs, suggestions for the documentation or just have some general comments, feel free to contact me via e-mail or as a GitHub issue.  (Of the two, I prefer GitHub.)


Copyright and License
---------------------

     PhD Thesis
     Copyright (C) 2003-2026 by Raymond Wan

"PhD thesis" is distributed under the terms of the GNU General Public License (GPL, version 3 or later) -- see the file LICENSE for details.

Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and no Back-Cover Texts. A copy of the license is included with the archive as LICENSE.

