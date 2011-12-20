#!/usr/bin/perl
use strict;
use warnings;

use List::Util qw(reduce);

my $num = '';
$num .= $_ for ( 0 .. 1_000_000 );
my @digits = ( 1, 10, 100, 1_000, 10_000, 100_000, 1_000_000 );
no warnings;
print reduce { $a * $b } map { substr( $num, $_, 1 ) } @digits;
print "\n";
use warnings;
