#!/usr/bin/perl
use strict;
use warnings;

use Math::BigInt;

my $num = new Math::BigInt(100)->bfac();
my $sum = 0;
for my $pos ( 0 .. length($num) - 1 ) {
    $sum += substr($num, $pos, 1);
}
print $sum;
print "\n";
