#!/usr/bin/env perl
use strict;
use warnings;

my $sum = 0;
my $pow = 5;

for my $num ( 2 .. $pow * 9 ** $pow ) {
    my $test_sum = 0;
    for my $digit ( 0 .. length($num) - 1 ) {
        $test_sum += substr($num, $digit, 1) ** $pow;
    }
    $sum += $num if $num == $test_sum;
}
print $sum;
print "\n";
