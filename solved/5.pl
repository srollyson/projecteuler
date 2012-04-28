#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(reduce);

my @divisors   = ( 1 .. 20 );
my @primes     = grep { is_prime($_) } @divisors;
my @non_primes = grep { !is_prime($_) } @divisors;

# This is the product of all of the primes multiplied together.
no warnings; # Complains about $a and $b.
my $candidate_check = reduce { $a * $b } @primes;
use warnings;

# Go through multiples of $candidate_check. If we find one that is divisible
# by all the non-primes, we've got our answer.
CANDIDATE_CHECK: for ( my $iter = 1 ; 1 ; $iter++ ) {
    my $candidate = $iter * $candidate_check;
    for (@non_primes) {
        next CANDIDATE_CHECK if $candidate % $_ != 0;
    }
    print "$candidate\n" and exit;
}

sub is_prime {
    my $num = shift;
    for ( 2 .. sqrt $num ) {
        return 0 if $num % $_ == 0;
    }
    return 1;
}
