#!/usr/bin/perl
use strict;
use warnings;

use List::Util qw(sum);

my $max_number = 1_000_000;
my %primes     = ();
@primes{ ( 2 .. $max_number - 1 ) } = (1) x ( $max_number - 1 );

# Sieve of Eratosthenes!
for my $num ( 2 .. sqrt $max_number ) {
    next if !$primes{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_number ; $sieve += $num ) {
        $primes{$sieve} = 0;
    }
}
my @twice_squares = map { 2 * ( $_**2 ) } ( 1 .. sqrt($max_number) / 2 );
my @odd_composites = grep { ( $_ % 2 ) && !$primes{$_} } ( 3 .. $max_number );
for my $odd_composite (@odd_composites) {
    print "$odd_composite\n" and exit if !passes_test($odd_composite);
}

sub passes_test {
    my ($num) = @_;
    for ( my $test = 0 ; $twice_squares[$test] < $num ; $test++ ) {
        return 1 if $primes{ $num - $twice_squares[$test] };
    }
    return 0;
}
