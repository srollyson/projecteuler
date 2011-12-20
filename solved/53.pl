#!/usr/bin/perl
use strict;
use warnings;

use Math::BigInt;

my $combinations = 0;

N: for my $n ( 1 .. 100 ) {
    for my $r ( 1 .. $n ) {
        $combinations++ if combinations( $n, $r ) > 1_000_000;
    }
}

print $combinations;
print "\n";

sub combinations {
    my ( $pool_size, $selection_size ) = @_;
    my $bigpool = Math::BigInt->new($pool_size);
    my $bigsel  = Math::BigInt->new($selection_size);
    my $bigdiff = Math::BigInt->new( $pool_size - $selection_size );
    $bigpool->bfac();
    $bigsel->bfac();
    $bigdiff->bfac();
    $bigsel->bmul($bigdiff);
    $bigpool->bdiv($bigsel);
    return $bigpool;
}
