PhD Thesis
==========

LaTeX source code for my PhD thesis, submitted in late 2003

Currently (2026) does not compile with recent versions of LaTeX...  Working on this...

The PDF version of the thesis can be found at the [University of Melbourne library](http://cat.lib.unimelb.edu.au/record=b2867173).


List of changes
---------------

List of changes in order for the LaTeX file to compile in 2026 are:

* Replaced the deprecated [doublespace](https://ctan.org/pkg/doublespace?lang=en) package with [setspace](https://ctan.org/pkg/setspace).
* Downloaded [psboxit.sty](https://ctan.org/pkg/psboxit?lang=en).
* Removed `\setstretch{}` from the `\newchapter` command in `visual.sty`.
* Changed `\begin{algorithm}[boxed,tbp]` to `\begin{algorithm}[tbp]`.
* Changed `\dontprintsemicolon` to `\DontPrintSemicolon` in algorithm2e environments.



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
     Copyright (C) 2003,2026 by Raymond Wan

"PhD thesis" is distributed under the terms of the GNU General Public License (GPL, version 3 or later) -- see the file LICENSE for details.

Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and no Back-Cover Texts. A copy of the license is included with the archive as LICENSE.

