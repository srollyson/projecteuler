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

my @sorted_primes =
  grep { $_ > 9 } sort { $a <=> $b } grep { $primes{$_} } keys %primes;
my @interesting_numbers = grep { is_interesting($_) } @sorted_primes;

print join ', ', @interesting_numbers;
print "\n" . sum @interesting_numbers;
print "\n";

sub is_interesting {
    my $num = shift;
    for my $pos ( 0 .. length $num - 1 ) {
        my $left = substr( $num, 0, $pos );
        my $right = substr( $num, $pos );
        return 0 if $left && !$primes{$left};
        return 0 if $right && !$primes{$right};
    }
    return 1;
}
