#!/usr/bin/perl -w
##  Script replaces \color[rgb]{0,0,0} in a pstex_t file to nothing.
##  Date:  2002/09/05

use diagnostics;
use strict;

use vars qw ($curr $opt_f);

use Getopt::Std;

###########################################################################
##  Check arguments
getopts ('f:');
if (!defined $opt_f) {
  print (STDERR "No filename defined with -f option!\n");
  exit (-1);
}

$opt_f =~ s/^(.*)_t$/$1/gs;
print (STDOUT "\\begin{picture}(0,0)%\n");
print (STDOUT "\\includegraphics{$opt_f}%\n");
print (STDOUT "\\end{picture}%\n");

while (<STDIN>) {
  $curr = $_;
  $curr =~ s/\\color\[rgb\]{0,0,0}//gs;
  print (STDOUT $curr);
}
