#!/usr/bin/perl -w
##  2003/05/08

##  Used for generating the figure:  fig:remerge-2b-Bhashing .

##  Execute with one argument, the length of the sequence in
##  symbols.
use diagnostics;
use strict;

use vars qw ($max_hash_count $max_bv_mult);
use vars qw ($seq_len @bv_mult $hash_count $temp $percent $i);

$max_hash_count = 7;
@bv_mult = (8, 16, 32);
$max_bv_mult = scalar (@bv_mult);

$seq_len = $ARGV[0];
$i = 0;
$hash_count = 0;

if (($seq_len eq "-h") || ($seq_len eq "-?")) {
  printf (STDERR "Usage:  b-hashing.pl <sequence length>\n");
  exit (-1);
}

printf (STDOUT "%%%% Sequence length %d\n", $seq_len);

printf (STDOUT "\\begin{tabular}{lccc}\n");
printf (STDOUT "  &\t ");
for ($i = 0; $i < $max_bv_mult; $i++) {
  printf (STDOUT "\$%d|\\Seq_1|\$ ", $bv_mult[$i]);
    if ($i != $max_bv_mult - 1) {
      printf (STDOUT "& ");
    }
}

printf (STDOUT "\\\\\n");

for ($hash_count = 1; $hash_count <= $max_hash_count; $hash_count++) {
  printf (STDOUT "%d &\t", $hash_count);
  for ($i = 0; $i < $max_bv_mult; $i++) {
    $temp = 1 / ($bv_mult[$i] * $seq_len);
    $temp = 1 - $temp;
    $temp = $temp ** ($hash_count * $seq_len);
    $temp = 1 - $temp;
    $temp = $temp ** $hash_count;
    $percent = $temp * 100;
    if ($percent < 10) {
      printf (STDOUT "{\\D}");
    }

#    printf (STDOUT "%f\\%% ", $percent);
    if (($hash_count == 3) && ($bv_mult[$i] == 8)) {
#      printf (STDOUT "\\fbox{");
    }
    printf (STDOUT "%3.2f\\%% ", $percent);
    if (($hash_count == 3) && ($bv_mult[$i] == 8)) {
#      printf (STDOUT "} ");
    }
    if ($i != $max_bv_mult - 1) {
      printf (STDOUT "& ");
    }
  }
  printf (STDOUT "\\\\\n");
}

printf (STDOUT "\\end{tabular}\n");
