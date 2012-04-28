#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);

my %pairs = ();
for my $num ( 1 .. 10000 - 1 ) {
    my $pair = sum_of_divisors($num);
    if ( sum_of_divisors($pair) == $num && $num != $pair ) {
        $pairs{$num}  = $pair;
        $pairs{$pair} = $num;
    }
}

print sum keys %pairs;
print "\n";

sub sum_of_divisors {
    my $num = shift;
    my $sum = 0;
    for ( 1 .. $num - 1 ) {
        if ( $num % $_ == 0 ) {
            $sum += $_;
        }
    }
    return $sum;
}
