#!/usr/bin/perl
use strict;
use warnings;

my $num = 600851475143;

for my $factor ( reverse 2 .. sqrt $num ) {
    if ( $num % $factor == 0 && is_prime($factor) ) {
        print "$factor\n" and exit;
    }
}

sub is_prime {
    my $num = shift;
    for my $factor ( 2 .. sqrt $num ) {
        return 0 if $num % $factor == 0;
    }
    return 1;
}
