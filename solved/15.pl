#!/usr/bin/perl
use strict;
use warnings;

# Permutation with repetitions. "DDRR" for $grid_size == 2 means we've got this:
#      (2*$grid_size)!
# -------------------------
# $grid_size! * $grid_size!     < "DD" and "RR"
my $grid_size = 20;
print factorial(2 * $grid_size) / (factorial($grid_size) * factorial($grid_size));
print "\n";

sub factorial {
    my $num = shift;

    my $val = 1;
    $val *= $_ for ( 1 .. $num );
    return $val;
}
