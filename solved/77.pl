#!/usr/bin/env perl
use strict;
use warnings;

#--[Sieve engine.]--------------------------------------------------------------
my $max_stored_prime = 500;
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
my $search_min = 5_000;
my $diff_ways  = 0;
my $test       = 1;
for ( $test = 1 ; $diff_ways < $search_min ; $test++ ) {
    my $prime_index = 0;
    $prime_index++ until $primes[$prime_index] >= $test;
    $diff_ways = num_of_ways( $test, $prime_index );
}
$test--;
print "$test\n";

sub num_of_ways {
    my ( $num, $prime_index ) = @_;
    my $ways = 0;
    for my $index ( reverse 0 .. $prime_index ) {
        my $this_prime = $primes[$index];
        next if $num < $this_prime;
        $ways++ if $num == $this_prime;
        $ways += num_of_ways( $num - $this_prime, $index );
    }
    return $ways;
}
