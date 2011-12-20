#!/usr/bin/perl
use strict;
use warnings;

#--[Sieve engine.]--------------------------------------------------------------
my $max_stored_prime = 100_000;
my %is_prime_hash    = ();
@is_prime_hash{ ( 2 .. $max_stored_prime - 1 ) } =
  (1) x ( $max_stored_prime - 2 );
for my $num ( 2 .. sqrt $max_stored_prime ) {
    next if !$is_prime_hash{$num};
    for ( my $sieve = 2 * $num ; $sieve < $max_stored_prime ; $sieve += $num ) {
        $is_prime_hash{$sieve} = 0;
    }
}
my @primes = sort { $a <=> $b } grep { $is_prime_hash{$_} } keys %is_prime_hash;

sub is_prime {
    my ($num) = @_;
    return $is_prime_hash{$num} if exists $is_prime_hash{$num};
    my $limit = sqrt($num);
    for my $prime (@primes) {
        return 1 if $prime > $limit;
        return 0 if $num % $prime == 0;
    }
    return 1;
}

#--[Execution.]-----------------------------------------------------------------

