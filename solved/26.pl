#!/usr/bin/perl
use strict;
use warnings;

use Math::BigFloat;

my $longest_cycle     = 0;
my $longest_cycle_num = 0;

for my $divisor ( 2 .. 999 ) {
    my $num = Math::BigFloat->bone()->bround(10_000)->bdiv( Math::BigFloat->new($divisor) );
    if ( $num =~ /\.\d*?(\d+?)\1\1/ ) {
        my $cycle = length $1;
        if ( $1 =~ /[1-9]/ ) {
            if ( $cycle > $longest_cycle ) {
                $longest_cycle     = $cycle;
                $longest_cycle_num = $divisor;
            }
        }
    }
}
print $longest_cycle_num;
print "\n";
