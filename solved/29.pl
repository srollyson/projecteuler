#!/usr/bin/perl
use strict;
use warnings;

use Math::BigInt;

my $limit = 100;

my %terms = ();

for $a ( 2 .. $limit ) {
    for $b ( 2 .. $limit ) {
        my $val = Math::BigInt->new($a);
        $val->bpow($b);
        $terms{$val} = 1;
    }
}

print scalar keys %terms;
print "\n";
