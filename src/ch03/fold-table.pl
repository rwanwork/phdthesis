#!/usr/bin/perl -w
##  Given a single column LaTeX table that ends each row with "\\%",
##  the table is halved so that it becomes two columns.  If more than
##  2 columns are required, then much more thought is required for
##  this code...
##
##  2002/11/22
use diagnostics;
use strict;

use vars qw ($curr $count @lines $i $n);

$count = 0;
while (<STDIN>) {
  $curr = $_;
  chop ($curr);
  if ($curr =~ /(.*)\\\\%/) {
    $lines[$count] = $1;
    $curr = $1;
    $count++;
  }
}

$n = $count / 2;
if ($count % 2 != 0) {
  $n++;
}

for ($i = 0; $i < $n; $i++) {
  if (($i + $n) >= $count) {
    printf (STDOUT "%s & \\\\\n", $lines[$i]);
    last;
  }
  else {
    printf (STDOUT "%s & %s \\\\\n", $lines[$i], $lines[$i + $n]);
  }
}
