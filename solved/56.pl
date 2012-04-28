#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(max sum);
use Math::BigInt;

my %nums = ();

for my $a ( 1 .. 99 ) {
    for my $b ( 1 .. 99 ) {
        my $num = Math::BigInt->new($a);
        $num->bpow($b);
        $nums{$num} = 1;
    }
}

print max(map {sum split //, $_} keys %nums);
print "\n";
