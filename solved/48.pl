#!/usr/bin/env perl
use strict;
use warnings;

use Math::BigInt;

my $max = 1000;
my $sum = new Math::BigInt;

for my $num ( map {new Math::BigInt($_)} 1 .. $max ) {
    $num->bpow($num);
    $sum->badd($num);
}

print substr($sum,-10);
print "\n";
