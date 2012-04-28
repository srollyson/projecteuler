#!/usr/bin/env perl
use strict;
use warnings;
use Math::BigFloat;

my $counter  = 0;
my $min_base = 1;
my $max_base = 9;

for ( my $exponent = 1 ; 1 ; $exponent++ ) {
    my $min_num = Math::BigFloat->new( 1 . ( 0 x ( $exponent - 1 ) ) ); # 100...
    my $max_num = Math::BigFloat->new( 9 x $exponent );                 # 999...
    my $root    = Math::BigFloat->new(1)->bdiv($exponent);
    $min_base = $min_num->bpow($root)->bceil();
    $max_base = $max_num->bpow($root)->bfloor();
    last if $min_base == 10;
    $counter += $max_base - $min_base + 1;
}
print "$counter\n";
