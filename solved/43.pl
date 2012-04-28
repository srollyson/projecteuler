#!/usr/bin/env perl
use strict;
use warnings;

use Algorithm::Loops qw(NextPermuteNum);
use List::Util qw(sum);

my @nums = 0 .. 9;

my @pandigitals = ();
push @pandigitals, join '', @nums while NextPermuteNum(@nums);

my @divisors = ( 2, 3, 5, 7, 11, 13, 17 );

sub has_property {
    my $num = shift;
    for my $starting_digit ( reverse 2 .. 8 ) {
        my $substr = substr( $num, $starting_digit - 1, 3 );
        return 0 if $substr % $divisors[ $starting_digit - 2 ];
    }
    return 1;
}

print sum grep { has_property($_) } @pandigitals;
print "\n";
