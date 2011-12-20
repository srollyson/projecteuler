#!/usr/bin/perl
use strict;
use warnings;

use Math::BigInt;

my @fibs = ( Math::BigInt->new(1), Math::BigInt->new(1) );
while ( $fibs[-1]->length < 1000 ) {
    my $num = Math::BigInt->new($fibs[-2]);
    $num->badd($fibs[-1]);
    push @fibs, $num;
}
print scalar @fibs;
print "\n";
