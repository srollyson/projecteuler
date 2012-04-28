#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);

my @pandigital_products = ();
PRODUCT: for my $guess ( 100 .. 10_000 ) {
    for my $multiplicand ( 2 .. $guess / 2 ) {
        next if $guess % $multiplicand;
        my $multiplier = $guess / $multiplicand;
        next
          unless (
            length($guess) + length($multiplicand) + length($multiplier) == 9 );
        my %digits = ();
        @digits{ split //, $guess }        = ();
        @digits{ split //, $multiplicand } = ();
        @digits{ split //, $multiplier }   = ();
        next if ( scalar keys %digits != 9 || exists $digits{0} );
        push @pandigital_products, $guess;
        next PRODUCT;
    }
}

print sum @pandigital_products;
print "\n";
