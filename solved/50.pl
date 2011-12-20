#!/usr/bin/perl
use strict;
use warnings;

my $max_number = 999_999;
my %is_prime   = ();
@is_prime{ ( 2 .. $max_number - 1 ) } = (1) x ( $max_number - 2 );

# Sieve of Eratosthenes!
for my $num ( 2 .. sqrt $max_number ) {
    next if !$is_prime{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_number ; $sieve += $num ) {
        $is_prime{$sieve} = 0;
    }
}

my @primes = sort { $a <=> $b } grep { $is_prime{$_} } keys %is_prime;

my $longest_chain        = 0;
my $end_of_longest_chain = 0;

for my $pos ( 0 .. $#primes / 2 ) {
    my $running_total = 0;
    my $offset        = 0;
    for (
        $offset = 0 ;
        ( $pos + $offset < scalar(@primes) / 2 )
          && $running_total < $max_number ;
        $offset++
      )
    {
        $running_total += $primes[ $pos + $offset ];
        if ( $is_prime{$running_total} && $offset > $longest_chain ) {
            $longest_chain        = $offset;
            $end_of_longest_chain = $running_total;
        }
    }
}

print "$end_of_longest_chain\n";
