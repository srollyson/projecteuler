#!/usr/bin/perl
use strict;
use warnings;

use Algorithm::Loops qw(NextPermuteNum);

my @nums = (0,1,2,3,4,5,6,7,8,9);
for ( 2 .. 1_000_000 ) {
    NextPermuteNum(@nums);
}
print join('',@nums);
print "\n";
