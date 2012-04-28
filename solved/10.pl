#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(sum);

my $max_number = 2_000_000;
my %candidates = ();
@candidates{(2 .. $max_number - 1)} = (1) x ($max_number - 2);

# Sieve of Eratosthenes!
for my $num ( 2 .. sqrt $max_number ) {
    next if !$candidates{$num};
    for ( my $sieve = 2 * $num; $sieve < $max_number; $sieve += $num ) {
        $candidates{$sieve} = 0;
    }
}

my @primes = grep { $candidates{$_} } keys %candidates;
print sum @primes;
print "\n";
