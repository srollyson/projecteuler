#!/usr/bin/perl
use strict;
use warnings;

use List::Util qw(sum);

my @list           = 1 .. 100;
my $sum_of_squares = sum map { $_**2 } @list;
my $square_of_sums = ( sum @list )**2;
print $square_of_sums - $sum_of_squares;
print "\n";
