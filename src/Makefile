############################################################################
##  Document Makefile                                                     ##
##  By:  Raymond Wan                                                      ##
##  Filename:  Makefile                                                   ##
##  Date:  2002/09/05                                                     ##
############################################################################

############################################################################
##  Variables for program names
LATEX	=	latex
DVIPS	=	dvips
BIBTEX	=	bibtex
JGRAPH	=	jgraph
MKINDEX	=	makeindex
PSNUP	=	psnup
FIGDEV	=	fig2dev
MAKEBIB =       ~/latex/bib/make-bib.pl


############################################################################
##  Implicit rules for figures
%.eps: %.fig
	$(FIGDEV) -L eps $< >$@
%.pstex_t: %.fig
	$(FIGDEV) -L pstex_t $< | fix-pstex.pl -f $@ >$@
%.pstex: %.fig
	$(FIGDEV) -L pstex $< >$@

############################################################################
##  Variables
THESIS	=	t
DOC	=	$(THESIS).ps
BIBPATH =       ~/latex/bib

############################################################################
##  Parts of the thesis

EXTRAS	=	abbrev.tex packages.tex visual.sty
BIBS	=	acm.bib book.bib ieee.bib mine.bib papers.bib \
		update.bib $(THESIS).bib
NONCHAP	=	$(THESIS).tex $(THESIS).bib front.tex

CH01PST	=	
CH01EPS =	ch01/browse-search.eps ch01/ir.eps
CH01	=	ch01/intro.tex ${CH01PST:.fig=.pstex} \
		${CH01PST:.fig=.pstex_t} ${CH01EPS:.fig=.eps}
CH02PST	=	
CH02EPS =	ch02/modelcoder.fig  ch02/huffman.fig \
		ch02/semistruct.fig ch02/arith.fig
CH02	=	ch02/tc.tex ${CH02PST:.fig=.pstex} \
		${CH02PST:.fig=.pstex_t} ${CH02EPS:.fig=.eps}
CH03PST	=	ch03/repair-datastruct.fig ch03/repair-seqnode-a.fig \
                ch03/repair-seqnode-b.fig ch03/repair-seqnode-c.fig \
                ch03/repair-seqnode-d.fig 
CH03EPS =	
CH03	=	ch03/repair.tex ch03/woodchuck-short.tex \
		ch03/repair-wsjhead.tex ch03/tab_repair-chi.tex \
		ch03/wsja-activeph.eps ${CH03PST:.fig=.pstex} \
		${CH03PST:.fig=.pstex_t} ${CH03EPS:.fig=.eps}
CH04PST	=	
CH04EPS =	ch04/chiastic-slide.fig ch04/wordbased.fig
CH04	=	ch04/bargraph-all.eps \
                ch04/woodchuck-short-phrases.tex \
                ch04/woodchuck-short-wa.tex \
                ch04/woodchuck-complete-wa-phrases.tex \
		ch04/prepair.tex ${CH04PST:.fig=.pstex} \
		${CH04PST:.fig=.pstex_t} ${CH04EPS:.fig=.eps}
CH05PST	=	ch05/remerge-phases.fig ch05/example2b-seq.fig \
		ch05/example2b-graph.fig \
		ch05/pa-2b.fig \
		ch05/example2b-cutvertex1.fig \
                ch05/example2b-cutvertex2.fig \
		ch05/example2b-cutvertex3.fig \
		ch05/example2b-cutvertex4.fig 
CH05EPS =	ch05/expandstr.fig 
CH05	=	ch05/wsj-char-repair.eps ch05/throughput.eps \
		ch05/wsj-char-remerge-e.eps ch05/wsj-char-append.eps \
		ch05/remerge.tex ch05/remerge-example1.tex \
		ch05/phraselinks.tex ch05/alg-phase2b.tex \
		ch05/alg-phase2a.tex \
		ch05/example2b-longph.tex ${CH05PST:.fig=.pstex} \
		${CH05PST:.fig=.pstex_t} ${CH05EPS:.fig=.eps}
CH06PST	=	ch06/review-block.fig ch06/skipblock-block.fig
CH06EPS =	
CH06	=	ch06/review.tex ch06/alg-review.tex \
		ch06/alg-huffblocks.tex ${CH06PST:.fig=.pstex} \
		${CH06PST:.fig=.pstex_t} ${CH06EPS:.fig=.eps}

CH07PST =	ch07/rephine.fig ch07/expandgraph.fig 
CH07EPS =	ch07/nounphrase.fig ch07/graph.fig \
		ch07/linkage-1.fig ch07/linkage-2.fig
CH07	=	ch07/rephine.tex ch07/parser-ex.tex \
		ch07/wsja_sample_parse.sgml \
		${CH07PST:.fig=.pstex} \
		${CH07PST:.fig=.pstex_t} ${CH07EPS:.fig=.eps}
CH08PST	=	
CH08EPS =	ch08/dist.ps \
		ch08/diskspace_requests_bpc.ps
CH08	=	ch08/web.tex ch08/context_10240.txt \
		${CH08PST:.fig=.pstex} \
		${CH08PST:.fig=.pstex_t} ${CH08EPS:.fig=.eps}
CH09PST	=	
CH09EPS =	ch09/restore.fig
CH09	=	ch09/conclude.tex ${CH09PST:.fig=.pstex} \
		${CH09PST:.fig=.pstex_t} ${CH09EPS:.fig=.eps}
APPPST	=	
APPEPS  =	
APP	=	app/notation.tex app/porter.tex ${APPPST:.fig=.pstex} \
		${APPPST:.fig=.pstex_t} ${APPEPS:.fig=.eps}


CHAPS	=	$(CH01) $(CH02) $(CH03) $(CH04) $(CH05) $(CH06) $(CH07) \
		$(CH08) $(CH09) $(APP)

BIBINPUTS=	

.PHONY : all clean clobber

############################################################################
# Makefile for all
############################################################################

all:  $(DOC) 

bib:  
	find  -name '*.tex' -exec grep "cite" {} \; >tmp
	cat tmp | $(MAKEBIB) -b $(BIBPATH) -m 1 | sort | uniq | $(MAKEBIB) -b $(BIBPATH) -m 2 >$(THESIS).bib
	rm -f tmp

$(THESIS).dvi:  $(EXTRAS) $(NONCHAP) $(CHAPS)
	$(LATEX) $(THESIS).tex
	$(BIBTEX) -min-crossrefs=5 $(THESIS)
#	$(MKINDEX) $(THESIS)
	$(LATEX) $(THESIS).tex
	$(LATEX) $(THESIS).tex 1>/dev/null 2>&1
	$(LATEX) $(THESIS).tex 1>latex_msgs 2>&1

$(DOC):  $(THESIS).dvi
	$(DVIPS) $(THESIS).dvi -o $(DOC)
	$(PSNUP) -2 $(THESIS).ps >t2.ps
#	ps2pdf t2.ps ~/main/www_public/t2.pdf
#	chmod ugo+r ~/main/www_public/t2.pdf

clean:
	rm -f -r *~ $(THESIS).dvi $(THESIS).ps
	rm -f -r *.bbl *.blg *.aux *.aux.bak *.dep *.log *.bak

clobber:  clean
	rm -f $(THESIS).loa $(THESIS).lof $(THESIS).lot $(THESIS).loa
	rm -f $(THESIS).lon
	rm -f $(THESIS).toc
	rm -f $(DOC)

##  End of makefile
