#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(min);

my @nums                = grep { $_ % 10 && $_ % 11 } ( 11 .. 99 );
my $numerator_product   = 1;
my $denominator_product = 1;
for my $numerator (@nums) {
    for my $denominator ( grep { $_ > $numerator } @nums ) {
        if ( is_curious( $numerator, $denominator ) ) {
            print "$numerator / $denominator\n";
            $numerator_product   *= $numerator;
            $denominator_product *= $denominator;
        }
    }
}

print "solution: $numerator_product / $denominator_product\n";
print "reduced:  " . reduced_string( $numerator_product, $denominator_product );
print "\n";

sub is_curious {
    my ( $numerator, $denominator ) = @_;
    my @numerator_digits   = split //, $numerator;
    my @denominator_digits = split //, $denominator;
    my $val                = $numerator / $denominator;
    return 1
      if ( $numerator_digits[0] / $denominator_digits[1] == $val )
      && ( $numerator_digits[1] == $denominator_digits[0] );
    return 1
      if ( $numerator_digits[1] / $denominator_digits[0] == $val )
      && ( $numerator_digits[0] == $denominator_digits[1] );
    return 0;
}

sub reduced_string {
    my ( $numerator, $denominator ) = @_;
    for my $divisor ( reverse 2 .. min( $numerator, $denominator ) ) {
        if ( $numerator % $divisor == 0 && $denominator % $divisor == 0 ) {
            return reduced_string( $numerator / $divisor,
                $denominator / $divisor );
        }
    }
    return "$numerator / $denominator";
}
