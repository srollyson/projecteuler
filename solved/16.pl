#!/usr/bin/env perl
use strict;
use warnings;

use Math::BigInt;

my $num = new Math::BigInt(2)->bpow(1000);
my $sum_of_digits = 0;
for ( 0 .. length($num) - 1 ) {
    $sum_of_digits += substr($num, $_, 1);
}
print $sum_of_digits;
print "\n";

